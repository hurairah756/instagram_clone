import 'package:flutter/material.dart';

import '../utils/constant_variables.dart';
import '../utils/utils.dart';
import 'custom_story_widget.dart';

class CustomStoryColumn extends StatelessWidget {
  final String personName;
  final String personImage;
  double? width;
  double? height;
  Color? color;
  CustomStoryColumn({
    super.key,
    required this.personName,
    required this.personImage,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomStoryWidget(
          profilePic: personImage,
          width: width ?? deviceWidth * .25,
          height: height ?? deviceWidth * .25,
          isStory: false,
        ),
        SizedBox(height: deviceHeight * .003),
        Text(
          personName,
          style: bodyText(
            fontWeight: color == null ? FontWeight.normal : FontWeight.w500,
            fontSize: color == null ? deviceHeight / 60 : deviceHeight / 62,
            textColor: color ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
