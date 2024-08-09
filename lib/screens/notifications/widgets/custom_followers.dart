import 'package:flutter/material.dart';

import '../../../utils/constant_images.dart';

class CustomFollowers extends StatelessWidget {
  final double circleRadius;
  final double imageCircleRadius;
  final double leftGap;
  final double bottomGap;
  bool? isSuggestion;
  CustomFollowers({
    super.key,
    required this.circleRadius,
    required this.imageCircleRadius,
    required this.leftGap,
    required this.bottomGap,
    this.isSuggestion = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CircleAvatar(
            radius: circleRadius,
            backgroundColor:
                isSuggestion! ? Colors.grey.shade300 : Colors.white,
            child: CircleAvatar(
                radius: imageCircleRadius,
                backgroundImage: const AssetImage(ConstantImages.CELEBRITY_2))),
        Positioned(
          left: leftGap,
          bottom: bottomGap,
          child: CircleAvatar(
              radius: circleRadius,
              backgroundColor:
                  isSuggestion! ? Colors.grey.shade300 : Colors.white,
              child: CircleAvatar(
                  radius: imageCircleRadius,
                  backgroundImage:
                      const AssetImage(ConstantImages.CELEBRITY_4))),
        )
      ],
    );
  }
}
