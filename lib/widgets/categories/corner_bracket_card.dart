import 'package:flutter/material.dart';

class CornerBracketPainter extends CustomPainter {
  final Color color;
  final double length; // how long each bracket arm is
  final double strokeWidth;
  final double radius; // optional corner rounding

  CornerBracketPainter({
    this.color = const Color(0xFFBA7517),
    this.length = 18,
    this.strokeWidth = 2,
    this.radius = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Top-left
    canvas.drawLine(
      const Offset(0, 0).translate(0, 0),
      Offset(0, length),
      paint,
    );
    canvas.drawLine(Offset.zero, Offset(length, 0), paint);

    // Top-right
    canvas.drawLine(
      Offset(size.width - length, 0),
      Offset(size.width, 0),
      paint,
    );
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, length), paint);

    // Bottom-right
    canvas.drawLine(
      Offset(size.width, size.height - length),
      Offset(size.width, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - length, size.height),
      Offset(size.width, size.height),
      paint,
    );

    // Bottom-left
    canvas.drawLine(
      Offset(0, size.height - length),
      Offset(0, size.height),
      paint,
    );
    canvas.drawLine(Offset(0, size.height), Offset(length, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CornerBracketPainter oldDelegate) =>
      color != oldDelegate.color ||
      length != oldDelegate.length ||
      strokeWidth != oldDelegate.strokeWidth;
}

class CornerBracketCard extends StatelessWidget {
  final Widget child;
  const CornerBracketCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CornerBracketPainter(),
      child: Padding(padding: const EdgeInsets.all(12), child: child),
    );
  }
}
