import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagramui/utils/constant_strings.dart';

import '../../../utils/constant_images.dart';
import '../../../utils/constant_variables.dart';
import '../../../widgets/custom_story_widget.dart';

class CustomInboxes extends StatelessWidget {
  final String personImage;
  final String personName;
  String? reelName;
  bool? isStory;
  CustomInboxes({
    super.key,
    required this.personImage,
    required this.personName,
    this.reelName,
    this.isStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: deviceHeight / 9,
      child: Row(
        children: [
          SizedBox(width: isStory! ? deviceWidth * .035 : deviceWidth * .045),
          isStory!
              ? Container(
                  alignment: Alignment.center,
                  width: deviceHeight / 11.2,
                  height: deviceHeight / 11.2,
                  child: CustomPaint(
                    painter: GradientCirclePainter(strokeWidth: 2.5),
                    child: Container(
                      width: deviceHeight / 11.2,
                      height: deviceHeight / 11.2,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(deviceHeight * .007),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(personImage),
                              ),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5)),
                        ),
                      ),
                    ),
                  ),
                )
              : ClipOval(
                  child: Image.asset(
                    personImage,
                    width: deviceHeight / 12.5,
                    height: deviceHeight / 12.5,
                    fit: BoxFit.cover,
                  ),
                ),
          SizedBox(width: isStory! ? deviceWidth * .035 : deviceWidth * .045),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(personName,
                    style: TextStyle(
                      fontSize: deviceHeight / 51,
                      fontWeight:
                          reelName == null ? FontWeight.w400 : FontWeight.bold,
                    )),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          isStory!
                              ? ConstantStrings.ACTIVE_NOW
                              : reelName ?? ConstantStrings.ACTIVE_1H_AGO,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: deviceHeight / 53,
                            fontWeight: reelName == null
                                ? FontWeight.w400
                                : FontWeight.w600,
                            color: reelName == null
                                ? Colors.grey.shade600
                                : Colors.black,
                          )),
                    ),
                    SizedBox(width: deviceWidth * .01),
                    reelName == null
                        ? const SizedBox.shrink()
                        : Text(ConstantStrings.H_13,
                            style: TextStyle(
                              fontSize: deviceHeight / 53,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade800,
                            )),
                    SizedBox(width: deviceWidth * .01),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: deviceWidth * .025),
          reelName == null
              ? const SizedBox.shrink()
              : CircleAvatar(
                  radius: deviceHeight * .005,
                  backgroundColor: Colors.blue,
                ),
          SizedBox(width: deviceWidth * .05),
          SizedBox(
              width: deviceWidth * .075,
              height: deviceWidth * .075,
              child: SvgPicture.asset(
                ConstantSvgs.IC_CAMERA_LINE,
                color: reelName == null ? Colors.grey : Colors.black,
                fit: BoxFit.fill,
              )),
          // Icon(Icons.camera_alt_outlined),
          SizedBox(width: deviceWidth * .045),
        ],
      ),
    );
  }
}
