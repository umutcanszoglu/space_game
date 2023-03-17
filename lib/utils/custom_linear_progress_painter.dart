import 'package:flutter/material.dart';

class CustomLinearProgressPainter extends CustomPainter {
  const CustomLinearProgressPainter({
    required this.backgroundColor,
    required this.valueColor,
    this.value = 0,
    this.textDirection = TextDirection.ltr,
    this.blurRadius,
  });

  final Color backgroundColor;
  final Color valueColor;
  final double value;
  final TextDirection textDirection;
  final double? blurRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(size.height / 2)), paint);

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0) return;

      double left;
      switch (textDirection) {
        case TextDirection.rtl:
          left = size.width - width - x;
          break;
        case TextDirection.ltr:
          left = x;
          break;
      }

      if (blurRadius != null) {
        paint.maskFilter = MaskFilter.blur(BlurStyle.solid, blurRadius!);
      }

      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Offset(left, 0.0) & Size(width, size.height), Radius.circular(size.height / 2)),
          paint);
    }

    drawBar(0.0, value.clamp(0.0, 1.0) * size.width);
  }

  @override
  bool shouldRepaint(CustomLinearProgressPainter oldDelegate) {
    return true;
  }
}
