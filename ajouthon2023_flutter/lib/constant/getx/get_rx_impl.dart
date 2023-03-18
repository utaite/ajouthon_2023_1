import 'dart:async';

import 'package:get/get.dart';
export 'package:get/get.dart' hide Rx;

mixin RxObjectMixin<T> on NotifyManager<T> {
  late T _value;

  void refresh() {
    subject.add(value);
  }

  T call([T? v]) {
    if (v != null) {
      value = v;
    }
    return value;
  }

  bool firstRebuild = false;
  bool sentToStream = false;

  String get string => value.toString();

  @override
  String toString() => value.toString();

  dynamic toJson() => value;

  @override
  bool operator ==(Object o) {
    if (o is T) return value == o;
    if (o is RxObjectMixin<T>) return value == o.value;
    return false;
  }

  @override
  int get hashCode => _value.hashCode;

  set value(T val) {
    if (subject.isClosed) return;
    sentToStream = false;
    if (_value == val && !firstRebuild) return;
    firstRebuild = false;
    _value = val;
    sentToStream = true;
    subject.add(_value);
  }

  T get value {
    RxInterface.proxy?.addListener(subject);
    return _value;
  }

  Stream<T> get stream => subject.stream;

  StreamSubscription<T> listenAndPump(void Function(T event) onData, {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    final subscription = listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );

    subject.add(value);

    return subscription;
  }

  void bindStream(Stream<T> stream) {
    final listSubscriptions = _subscriptions[subject] ??= <StreamSubscription>[];
    listSubscriptions.add(stream.listen((va) => value = va));
  }
}

class RxNotifier<T> = RxInterface<T> with NotifyManager<T>;

mixin NotifyManager<T> {
  GetStream<T> subject = GetStream<T>();
  final _subscriptions = <GetStream, List<StreamSubscription>>{};

  bool get canUpdate => _subscriptions.isNotEmpty;

  void addListener(GetStream<T> rxGetx) {
    if (!_subscriptions.containsKey(rxGetx)) {
      final subs = rxGetx.listen((data) {
        if (!subject.isClosed) subject.add(data);
      });
      final listSubscriptions = _subscriptions[rxGetx] ??= <StreamSubscription>[];
      listSubscriptions.add(subs);
    }
  }

  StreamSubscription<T> listen(
    void Function(T) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      subject.listen(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError ?? false,
      );

  void clear() {
    _subscriptions.forEach((getStream, _subscriptions) {
      for (final subscription in _subscriptions) {
        subscription.cancel();
      }
    });

    _subscriptions.clear();
  }

  void close() {
    clear();
    subject.close();
  }
}

class Rx<T> extends _RxImpl<T> {
  Rx(T initial) : super(initial);

  @override
  dynamic toJson() {
    try {
      return (value as dynamic)?.toJson();
    } on Exception catch (_) {
      throw '$T has not method [toJson]';
    }
  }
}

abstract class _RxImpl<T> extends RxNotifier<T> with RxObjectMixin<T> {
  _RxImpl(T initial) {
    _value = initial;
  }

  void addError(Object error, [StackTrace? stackTrace]) {
    subject.addError(error, stackTrace);
  }

  Stream<R> map<R>(R Function(T? data) mapper) => stream.map(mapper);

  void update(void Function(T? val) fn) {
    fn(_value);
    subject.add(_value);
  }

  void trigger(T v) {
    var firstRebuild = this.firstRebuild;
    value = v;
    if (!firstRebuild) {
      subject.add(v);
    }
  }
}

extension BoolExtension on bool {
  RxBool get obs => RxBool(this);
}

extension DoubleExtension on double {
  RxDouble get obs => RxDouble(this);
}

extension IntExtension on int {
  RxInt get obs => RxInt(this);
}

extension ListExtension<T> on List<T> {
  RxList<T> get obs => RxList<T>(this);
}

extension StringExtension on String {
  RxString get obs => RxString(this);
}

extension RxT<T> on T {
  Rx<T> get obs => Rx<T>(this);
}

class RxBool extends Rx<bool> {
  RxBool(bool initial) : super(initial);
}

class RxDouble extends Rx<double> {
  RxDouble(double initial) : super(initial);
}

class RxInt extends Rx<int> {
  RxInt(int initial) : super(initial);
}

class RxList<T> extends Rx<List<T>> {
  RxList(List<T> initial) : super(initial);
}

class RxString extends Rx<String> {
  RxString(String initial) : super(initial);
}
