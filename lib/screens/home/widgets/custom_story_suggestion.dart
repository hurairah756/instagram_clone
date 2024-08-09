import 'package:flutter/material.dart';

import '../../../utils/constant_variables.dart';
import '../../../widgets/custom_story_column.dart';

class CustomStorySuggestion extends StatelessWidget {
  final String profileImage;
  final String storyContent;
  final String personName;
  const CustomStorySuggestion({
    super.key,
    required this.profileImage,
    required this.storyContent,
    required this.personName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        width: deviceWidth / 2.8,
        height: deviceHeight / 2.6,
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(deviceHeight * .007),
            image: DecorationImage(
              image: AssetImage(storyContent),
              // fit: BoxFit.fill,
            )),
      ),
      Positioned(
        bottom: deviceHeight * .015,
        child: CustomStoryColumn(
          personName: personName,
          personImage: profileImage,
          width: deviceWidth * .23,
          height: deviceWidth * .23,
          color: Colors.white,
        ),
      )
    ]);
  }
}
