import 'package:flutter/material.dart';

import '../utils/constant_colors.dart';
import '../utils/constant_variables.dart';

class CustomStoryWidget extends StatelessWidget {
  final String profilePic;
  final double width;
  final double height;
  final bool isStory;
  const CustomStoryWidget({
    super.key,
    required this.profilePic,
    required this.width,
    required this.height,
    required this.isStory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: CustomPaint(
        painter: GradientCirclePainter(
          strokeWidth: isStory ? 1.8 : 2.8,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(
                isStory ? deviceHeight * .007 : deviceHeight * .009),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: isStory
                      ? NetworkImage(profilePic)
                      : AssetImage(profilePic),
                ),
                shape: BoxShape.circle,
                border: isStory
                    ? const Border()
                    : Border.all(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientCirclePainter extends CustomPainter {
  final double strokeWidth;
  GradientCirclePainter({required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const Gradient gradient = LinearGradient(
      colors: ConstantColors.storyColors,
      stops: ConstantVariables.storyStops,
      begin: Alignment(1, -1),
      end: Alignment(-1, 1),
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
