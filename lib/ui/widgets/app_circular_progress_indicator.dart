import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCircularProgressIndicator extends StatefulWidget {
  const AppCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  State<AppCircularProgressIndicator> createState() =>
      _AppCircularProgressIndicatorState();
}

class _AppCircularProgressIndicatorState
    extends State<AppCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController
      ..addListener(_updateUI)
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(_updateUI);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
        child: CustomPaint(
          size: Size.fromRadius(20.r),
          painter: _GradientCircularProgressPainter(
            radius: 20.r,
            strokeWidth: 2.w,
          ),
        ),
      ),
    );
  }

  void _updateUI() {
    setState(() {});
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter({
    required this.radius,
    required this.strokeWidth,
  });
  final double radius;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final double centerPoint = size.height / 2;

    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: const [
        Color.fromARGB(255, 228, 255, 210),
        Color.fromARGB(255, 145, 202, 108),
      ],
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(100),
      endAngle: _degreeToRad(100 + 360.0),
    ).createShader(
        Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));
    final scapSize = strokeWidth;
    final double scapToDegree = scapSize / centerPoint;
    final double startAngle = _degreeToRad(100) + scapToDegree;
    final double sweepAngle = _degreeToRad(360) - 2 * scapToDegree;

    canvas.drawArc(
      Offset.zero & Size(size.width, size.width),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
    paint
      ..color = Colors.black.withOpacity(0.9)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
    canvas.drawArc(
      Offset.zero & Size(size.width, size.width),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double _degreeToRad(double degree) => degree * pi / 180;
}
