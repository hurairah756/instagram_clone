import 'package:flutter/material.dart';

import '../../../utils/constant_images.dart';
import '../../../utils/constant_strings.dart';
import '../../../utils/constant_variables.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_story_widget.dart';
import 'custom_followers.dart';

class CustomNotification extends StatelessWidget {
  final String postDesc;
  final String postTime;
  String? profileImage;
  String? contentImage;
  String? postId;
  String? postBottomId;
  bool? isContent;
  bool? isButton;
  bool? isFollowing;
  bool? isStory;
  bool? isRequested;
  bool? isInvited;
  bool? isOfficial;
  bool? isVerified;
  CustomNotification({
    super.key,
    this.profileImage,
    this.postId,
    this.postBottomId,
    required this.postDesc,
    required this.postTime,
    this.contentImage,
    this.isButton = false,
    this.isContent = false,
    this.isFollowing = false,
    this.isStory = false,
    this.isRequested = false,
    this.isOfficial = false,
    this.isVerified = false,
    this.isInvited = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: isStory! ? deviceWidth * .03 : deviceWidth * .045,
          right: deviceWidth * .045),
      child: Row(
        crossAxisAlignment: isStory!
            ? CrossAxisAlignment.center
            : postDesc.length >= 60 ||
                    isButton == true ||
                    postBottomId != null ||
                    isInvited!
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: [
          isStory!
              ? Container(
                  alignment: Alignment.center,
                  width: deviceHeight / 14,
                  height: deviceHeight / 14,
                  child: CustomPaint(
                    painter: GradientCirclePainter(strokeWidth: 2.5),
                    child: Container(
                      width: deviceHeight / 14,
                      height: deviceHeight / 14,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(deviceHeight * .008),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    profileImage ?? ConstantImages.CELEBRITY_1),
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 0.5)),
                        ),
                      ),
                    ),
                  ),
                )
              : isOfficial!
                  ? Container(
                      alignment: Alignment.center,
                      width: deviceHeight / 17,
                      height: deviceHeight / 17,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(deviceHeight * .012),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.7, color: Colors.black)),
                          child: Text(
                            '𝐢',
                            style: TextStyle(fontSize: deviceHeight / 48),
                          ),
                        ),
                      ),
                    )
                  : isInvited!
                      ? SizedBox(
                          height: deviceWidth * .13,
                          width: deviceWidth * .12,
                          child: CustomFollowers(
                            circleRadius: deviceWidth * .05,
                            imageCircleRadius: deviceWidth * .045,
                            leftGap: deviceWidth * .025,
                            bottomGap: 0,
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          width: deviceHeight / 17,
                          height: deviceHeight / 17,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(profileImage ??
                                      ConstantImages.CELEBRITY_1),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 0.7, color: Colors.grey.shade200)),
                        ),
          SizedBox(width: isStory! ? deviceWidth * .03 : deviceWidth * .04),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: postDesc.length >= 60 ||
                          isButton == true ||
                          postBottomId != null ||
                          isInvited!
                      ? deviceHeight * .005
                      : 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(postId == null ? "" : postId!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: deviceHeight / 55,
                                  color: Colors.black)),
                          SizedBox(width: isVerified! ? deviceWidth * .005 : 0),
                          isVerified!
                              ? SizedBox(
                                  width: deviceHeight / 62,
                                  height: deviceHeight / 62,
                                  child: Image.asset(
                                    ConstantImages.BLUE_TICK_VERIFIED,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    CustomTextSpan(spanText: postDesc),
                    CustomTextSpan(
                        spanText: postBottomId == null ? "" : postBottomId!,
                        fontWeight: FontWeight.w600),
                    CustomTextSpan(
                        spanText: postId == null || isVerified!
                            ? postTime
                            : postId!.length >= 14
                                ? postTime
                                : postDesc.length >= 60
                                    ? '\n$postTime'
                                    : postTime,
                        color: Colors.grey),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
              width:
                  isButton == true || isFollowing == true || isContent == true
                      ? deviceWidth * .025
                      : 0),
          isContent == true
              ? Container(
                  alignment: Alignment.center,
                  width: deviceHeight / 17,
                  height: deviceHeight / 17,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          contentImage ?? ConstantImages.CURIOSITY_COVER),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(deviceHeight / 70),
                  ),
                )
              : isButton == true || isFollowing == true
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: postDesc.length >= 60 || isButton == true
                              ? deviceHeight * .01
                              : 0),
                      child: Container(
                        alignment: Alignment.center,
                        width: isRequested!
                            ? deviceHeight / 7
                            : isFollowing!
                                ? deviceHeight / 8
                                : deviceHeight / 10,
                        height: isFollowing!
                            ? deviceHeight / 24
                            : deviceHeight / 23,
                        decoration: BoxDecoration(
                          color:
                              isFollowing! ? Colors.grey.shade200 : Colors.blue,
                          borderRadius:
                              BorderRadius.circular(deviceHeight / 80),
                        ),
                        child: Text(
                          isRequested!
                              ? ConstantStrings.FOLLOW_BACK
                              : isButton!
                                  ? ConstantStrings.FOLLOW
                                  : isFollowing!
                                      ? ConstantStrings.FOLLOW
                                      : ConstantStrings.FOLLOW,
                          style: TextStyle(
                            color: isFollowing! ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
