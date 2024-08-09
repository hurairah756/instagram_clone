import 'package:flutter/material.dart';

import '../utils/constant_colors.dart';
import '../utils/constant_variables.dart';

class CustomMetaSearchBox extends StatelessWidget {
  const CustomMetaSearchBox({
    super.key,
    required this.search,
  });

  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * .045),
      child: TextField(
        controller: search,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: deviceHeight / 100, horizontal: deviceWidth / 25),
          hintText: 'Ask Meta AI or Search',
          hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: deviceHeight / 48,
              fontWeight: FontWeight.w400),
          prefixIcon: Padding(
            padding: EdgeInsets.all(deviceHeight * .015),
            child: CustomPaint(
              painter: GradientCircleMetaAvatar(strokeWidth: 5.5),
            ),
          ),
          filled: true,
          fillColor: Colors.grey.shade200.withOpacity(0.9),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(deviceHeight / 30),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(deviceHeight / 30),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class GradientCircleMetaAvatar extends CustomPainter {
  final double strokeWidth;
  GradientCircleMetaAvatar({required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const Gradient gradient = LinearGradient(
      colors: ConstantColors.metaColors,
      stops: ConstantVariables.metaStops,
      begin: Alignment(-1, 0.6),
      end: Alignment(0.6, 1),
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = (size.width / 2) - 1.5;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
