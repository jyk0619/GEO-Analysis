import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;

class DonutChart extends StatefulWidget {
  final double radius;
  final double strokeWidth;
  final double total;
  final double value;
  final Widget? child;

  const DonutChart({
    super.key,
    this.radius = 100,
    this.strokeWidth = 20,
    required this.total,
    required this.value,
    this.child,
  });

  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _angleAnimation = Tween<double>(
      begin: 0,
      end: (widget.value / widget.total) * 360, // 도(degree) 단위
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _angleAnimation,
      builder: (context, child) {
        return CustomPaint(
          painter: _DonutChartPainter(
            strokeWidth: widget.strokeWidth,
            sweepAngleDegrees: _angleAnimation.value,
          ),
          size: Size(widget.radius * 2, widget.radius * 2),
          child: Center(child: widget.child),
        );
      },
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  final double strokeWidth;
  final double sweepAngleDegrees;

  _DonutChartPainter({
    required this.strokeWidth,
    required this.sweepAngleDegrees,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2 - strokeWidth / 2;

    // 배경 원
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // 진행 원
    final Paint valuePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // 전체 원
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.radians(-90),
      math.radians(360),
      false,
      backgroundPaint,
    );

    // 값에 해당하는 진행 원
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.radians(-90),
      math.radians(-sweepAngleDegrees),
      false,
      valuePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _DonutChartPainter oldDelegate) {
    return oldDelegate.sweepAngleDegrees != sweepAngleDegrees ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
