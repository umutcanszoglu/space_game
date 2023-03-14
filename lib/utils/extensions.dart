extension DoubleX on double {
  String get doubleFormatter {
    if (this > 999999999) {
      return "${(this / 1000000000).round()} B";
    }
    if (this > 999999) {
      return "${(this / 1000000).round()} M";
    }
    if (this > 999) {
      return "${(this / 1000).round()} K";
    } else {
      return toStringAsFixed(1);
    }
  }
}
