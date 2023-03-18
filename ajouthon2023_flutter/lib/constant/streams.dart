import 'dart:math';

class Streams {
  static const int _milliseconds = 3;
  static const Duration _duration = Duration(milliseconds: _milliseconds);
  static const int _total = 100;

  static Stream<double> durationStream(double current, bool next, {double? nextValue}) {
    final _next = nextValue ?? (next ? 1 : 0);

    if (_next != current) {
      final c = current * _total;
      final n = _next * _total;
      final count = (n - c).floor().abs();

      return Stream.periodic(_duration, (i) => n > c ? i : -i).map((i) => min(1.0, max(0.0, (c + i) / _total))).take(count + 1);
    }

    return Stream.value(_next);
  }
}
