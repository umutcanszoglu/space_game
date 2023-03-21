extension DoubleX on double {
  String get doubleFormatter {
    if (this > 999999999999999999) {
      return "${(this / 1000000000000000000).toStringAsFixed(2)}QT";
    }
    if (this > 999999999999999) {
      return "${(this / 1000000000000000).toStringAsFixed(2)}Q";
    }
    if (this > 999999999999) {
      return "${(this / 1000000000000).toStringAsFixed(2)}T";
    }
    if (this > 999999999) {
      return "${(this / 1000000000).toStringAsFixed(2)}B";
    }
    if (this > 999999) {
      return "${(this / 1000000).toStringAsFixed(2)}M";
    }
    if (this > 999) {
      return "${(this / 1000).toStringAsFixed(2)}K";
    } else {
      return toStringAsFixed(1);
    }
  }
}
