import 'package:ajouthon2023/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/route/route_model.dart';
import 'getx/get_rx_impl.dart' as getx;
import 'routes.dart';
import 'util.dart';

typedef WidgetFunc = Widget Function();

extension BoolOptionalEx on bool? {
  bool get elvis => this ?? false;
}

extension BrightnessOptionalEx on Brightness? {
  Brightness get elvis => this ?? Brightness.light;

  bool get isDark => this == Brightness.dark;

  ThemeData get theme => (isDark ? ThemeData.dark() : ThemeData.light()).applyTheme();

  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  SystemUiOverlayStyle get statusBarStyle => isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
}

extension ColorOptionalEx on Color? {
  Color get elvis => this ?? Colors.transparent;
}

extension DateTimeOptionalEx on DateTime? {
  DateTime get elvis => this ?? now.midnight;
}

extension DateTimeEx on DateTime {
  DateTime get midnight => DateTime(year, month, day);

  Duration compareDuration(DateTime other) {
    final duration = difference(other.isAfter(this) ? other.subtract(const Duration(days: 1)) : other);
    return duration.inHours >= 24 ? duration - const Duration(hours: 24) : duration;
  }
}

extension DoubleOptionalEx on double? {
  double get elvis => this ?? 0.0;
}

extension DurationOptionalEx on Duration? {
  Duration get elvis => this ?? Duration.zero;

  bool get isZero => elvis == Duration.zero;
}

extension IntOptionalEx on int? {
  int get elvis => this ?? 0;
}

extension IterableOptionalEx<T> on Iterable<T>? {
  Iterable<T> get elvis => this ?? const [];

  T? operator [](int? i) => (i?.isNotNegative).elvis && elvis.length > i.elvis ? elvis.elementAt(i.elvis) : null;

  T? get firstOrNull => isset ? elvis.first : null;

  T? get secondOrNull {
    final iterator = elvis.iterator;
    return Iterable.generate(2).any((_) => !iterator.moveNext()) ? null : iterator.current;
  }

  T? get thirdOrNull {
    final iterator = elvis.iterator;
    return Iterable.generate(3).any((_) => !iterator.moveNext()) ? null : iterator.current;
  }

  T? get fourthOrNull {
    final iterator = elvis.iterator;
    return Iterable.generate(4).any((_) => !iterator.moveNext()) ? null : iterator.current;
  }

  T? get lastOrNull => isset ? elvis.last : null;

  T? get lastSecondOrNull => isset && elvis.length > 1 ? elvis[elvis.length - 2] : null;

  int get lastIndex => isset ? elvis.length - 1 : 0;

  bool get isNullOrEmpty => this == null || (this?.isEmpty).elvis;

  bool get isset => !isNullOrEmpty;

  Map<Type, dynamic> withType() => Map.fromEntries([
        ...elvis.map((x) => MapEntry(x.runtimeType, x)),
      ]);

  Map<Type, List<dynamic>> withTypeList() => Map.fromEntries([
        ...elvis.whereType<List>().map((x) => MapEntry(x.runtimeType, x)),
      ]);
}

extension ListEx<T> on List<T>? {
  List<T> get elvis => this ?? const [];
}

extension NumNullableEx on num? {
  num get elvis => this ?? 0;
}

extension NumEx on num {
  bool get isPositive => this > 0;

  bool get isNotNegative => !isNegative;
}

extension RouteModelEx on RouteModel {
  Future<T?> toNamed<T>({int? navigatorId, Iterable<dynamic>? arguments}) async => await Get.toNamed<T>(
        routes.name,
        arguments: arguments is Iterable<dynamic>
            ? Map.fromEntries([
                ...arguments.map((x) => MapEntry(x.runtimeType, x)),
              ])
            : null,
        id: navigatorId,
        preventDuplicates: false,
      );

  Future<T?> offAllNamed<T>({int? navigatorId, Iterable<dynamic>? arguments}) async => await Get.offAllNamed<T>(
        routes.name,
        arguments: arguments is Iterable<dynamic>
            ? Map.fromEntries([
                ...arguments.map((x) => MapEntry(x.runtimeType, x)),
              ])
            : null,
        id: navigatorId,
      );
}

extension RxNullableEx<T> on Rx<T>? {
  Widget rx(Widget Function(Rx<T> rx) builder, {Widget? onEmpty}) {
    return this is Rx<T> ? ObxValue<Rx<T>>(builder, this!) : onEmpty ?? const SizedBox.shrink();
  }
}

extension GetXRxNullableEx<T> on getx.Rx<T>? {
  Widget rx(Widget Function(getx.Rx<T> rx) builder, {Widget? onEmpty}) {
    return this is getx.Rx<T> ? ObxValue<getx.Rx<T>>(builder, this!) : onEmpty ?? const SizedBox.shrink();
  }
}

extension RxListNullableEx<T> on RxList<T>? {
  Widget rx(Widget Function(RxList<T> rx) builder, {Widget? onEmpty}) {
    return this is RxList<T> ? ObxValue<RxList<T>>(builder, this!) : onEmpty ?? const SizedBox.shrink();
  }
}

extension GetXRxListNullableEx<T> on getx.RxList<T>? {
  Widget rx(Widget Function(getx.RxList<T> rx) builder, {Widget? onEmpty}) {
    return this is getx.RxList<T> ? ObxValue<getx.RxList<T>>(builder, this!) : onEmpty ?? const SizedBox.shrink();
  }
}

extension RxMapNullableEx<K, V> on RxMap<K, V>? {
  Widget rx(Widget Function(RxMap<K, V> rx) builder, {Widget? onEmpty}) {
    return this is RxMap<K, V> ? ObxValue<RxMap<K, V>>(builder, this!) : onEmpty ?? const SizedBox.shrink();
  }
}

extension OffsetOptionalEx on Offset? {
  Offset get elvis => this ?? const Offset(0, 0);
}

extension RoutesNullableEx on Routes? {
  MapEntry<WidgetFunc, Bindings?>? get entry => pages[this];
}

extension ScrollControllerEx on ScrollController {
  bool get isMoreLoad => position.pixels >= position.maxScrollExtent - 150;
}

extension StreamOptionalEx<T> on Stream<T>? {
  Stream<T> get elvis => this ?? const Stream.empty();
}

extension StringOptionalEx on String? {
  String get elvis => this ?? '';

  bool get isNullOrEmpty => this == null || (this?.isEmpty).elvis;

  bool get isset => !isNullOrEmpty;

  String get snakeToCamel => toCamel('_');

  String get hyphenToCamel => toCamel('-');

  String toCamel(String separated) => elvis.contains(separated)
      ? elvis
          .split(separated)
          .asMap()
          .entries
          .map((x) => x.key > 0 && x.value.length > 1 ? x.value[0].toUpperCase() + x.value.substring(1).toLowerCase() : x.value.toLowerCase())
          .join()
      : elvis.toLowerCase();
}

extension ThemeDataEx on ThemeData {
  ThemeData applyTheme() {
    const primaryColor = Colors.blueGrey;

    return ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 54,
        elevation: 1,
        titleTextStyle: textBlack18.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      colorScheme: (brightness.isDark ? const ColorScheme.dark() : const ColorScheme.light()).copyWith(
        primary: primaryColor,
        secondary: primaryColor,
        onPrimary: Colors.white,
        onSecondary: primaryColor,
      ),
      primaryColor: primaryColor,
    );
  }
}

extension ThemeDataOptionalEx on ThemeData? {
  ThemeData get elvis => this ?? ThemeData.fallback();
}

extension ValueNullableEx<T> on Value<T>? {
  Widget rx(
    NotifierBuilder<T> widget, {
    Widget Function(String? e)? onError,
    Widget? onLoading,
    Widget? onEmpty,
  }) {
    return this?.rx(widget, onError: onError, onLoading: onLoading, onEmpty: onEmpty) ?? const SizedBox.shrink();
  }
}

extension ValueEx<T> on Value<T> {
  Widget rx(
    NotifierBuilder<T> widget, {
    Widget Function(String? error)? onError,
    Widget? onLoading,
    Widget? onEmpty,
  }) {
    return SimpleBuilder(builder: (_) {
      if (status.isLoading) {
        return onLoading ??
            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
      } else if (status.isError) {
        return onError is Widget Function(String?) ? onError(status.errorMessage) : const SizedBox.shrink();
      } else if (status.isEmpty) {
        return onEmpty ?? const SizedBox.shrink();
      }
      return widget(value!);
    });
  }
}

extension WidgetOptionalEx on Widget? {
  Widget get elvis => this ?? const SizedBox();
}

extension WidgetEx on Widget {
  Future<T?> showDialog<T>({Bindings? binding, barrierDismissible = false, Iterable<dynamic>? arguments}) async {
    binding?.dependencies();
    return await Get.dialog<T>(
      this,
      barrierDismissible: barrierDismissible,
      arguments: arguments.withType(),
    );
  }

  Future<T?> showBottomSheet<T>({Bindings? binding, Iterable<dynamic>? arguments}) async {
    binding?.dependencies();
    return await Get.bottomSheet<T>(this,
        isScrollControlled: true,
        settings: RouteSettings(
          arguments: arguments.withType(),
        ));
  }

  Widget disabled({bool enabled = false}) => enabled
      ? this
      : Opacity(
          opacity: 0,
          child: IgnorePointer(
            ignoring: true,
            child: this,
          ),
        );

  Widget maxWidth({
    double width = 360,
  }) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: width),
          child: this,
        ),
      ],
    );
  }

  Widget get red => ColoredBox(
        color: Colors.red,
        child: this,
      );

  Widget get green => ColoredBox(
        color: Colors.green,
        child: this,
      );

  Widget get blue => ColoredBox(
        color: Colors.blue,
        child: this,
      );
}

extension WidgetBuilderOptionalEx on WidgetBuilder? {
  Widget elvis(BuildContext context) => this?.call(context) ?? const SizedBox();
}

extension WidgetFuncOptionalEx on WidgetFunc? {
  WidgetFunc get elvis => this ?? () => const SizedBox.shrink();
}
