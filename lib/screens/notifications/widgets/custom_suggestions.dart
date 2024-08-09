import 'package:flutter/material.dart';
import 'package:instagramui/utils/constant_strings.dart';

import '../../../utils/constant_images.dart';
import '../../../utils/constant_variables.dart';
import 'custom_followers.dart';

class CustomSuggestion extends StatelessWidget {
  final String personImage;

  final String personUserName;
  final String personName;
  String? followingPersonsName;
  String? followedByPersonImage;
  bool? isMoreThanTwo;
  CustomSuggestion({
    super.key,
    required this.personImage,
    required this.personName,
    required this.personUserName,
    this.followedByPersonImage,
    this.followingPersonsName,
    this.isMoreThanTwo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * .045),
      child: SizedBox(
        width: double.infinity,
        height: deviceHeight / 8.7,
        child: Row(
          children: [
            CircleAvatar(
              radius: deviceWidth * .085,
              backgroundColor: Colors.grey.shade300,
              child: CircleAvatar(
                radius: deviceWidth * .083,
                backgroundImage: AssetImage(personImage),
              ),
            ),
            SizedBox(width: deviceWidth * .045),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: deviceHeight * .005),
                  Text(personUserName,
                      style: TextStyle(
                        fontSize: deviceHeight / 53,
                        fontWeight: FontWeight.w500,
                      )),
                  Text(personName,
                      style: TextStyle(
                          fontSize: deviceHeight / 55,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600)),
                  SizedBox(width: deviceHeight * .005),
                  Row(
                    children: [
                      followingPersonsName == null
                          ? const SizedBox()
                          : isMoreThanTwo!
                              ? SizedBox(
                                  height: deviceWidth * .08,
                                  width: deviceWidth * .08,
                                  child: CustomFollowers(
                                    circleRadius: deviceWidth * .03,
                                    imageCircleRadius: deviceWidth * .027,
                                    leftGap: deviceWidth * .02,
                                    bottomGap: 0,
                                    isSuggestion: true,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: deviceWidth * .03,
                                  backgroundColor: Colors.grey.shade300,
                                  child: CircleAvatar(
                                    radius: deviceWidth * .027,
                                    backgroundImage: AssetImage(
                                        followedByPersonImage ??
                                            ConstantImages.CELEBRITY_1),
                                  ),
                                ),
                      SizedBox(
                          width: followingPersonsName == null
                              ? 0
                              : deviceWidth * .02),
                      Expanded(
                        child: Text(
                            followingPersonsName ??
                                ConstantStrings.NEW_TO_INSTAGRAM,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: deviceHeight / 65,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            )),
                      ),
                      SizedBox(width: deviceWidth * .001),
                    ],
                  ),
                  SizedBox(width: deviceHeight * .005),
                ],
              ),
            ),
            // SizedBox(width: deviceWidth * .005),
            Container(
                alignment: Alignment.center,
                width: deviceHeight / 10,
                height: deviceHeight / 23,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(deviceHeight / 80),
                ),
                child: const Text(ConstantStrings.FOLLOW,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ))),
            SizedBox(width: deviceWidth * .035),
            Icon(
              Icons.clear,
              size: deviceHeight / 50,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
