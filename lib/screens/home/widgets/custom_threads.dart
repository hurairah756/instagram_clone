import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagramui/utils/constant_strings.dart';

import '../../../utils/constant_images.dart';
import '../../../utils/constant_variables.dart';
import '../../../utils/utils.dart';

class CustomThreads extends StatelessWidget {
  final String threadDescription;
  final String personImage;
  final String personName;
  String? threadImageCover;
  CustomThreads({
    super.key,
    required this.threadDescription,
    required this.personImage,
    required this.personName,
    this.threadImageCover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.7), width: 1),
        borderRadius: BorderRadius.circular(deviceHeight / 60),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: deviceHeight * .02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceWidth * .035),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: deviceWidth * .043,
                    backgroundColor: Colors.grey.shade400,
                    child: CircleAvatar(
                      radius: deviceWidth * .04,
                      backgroundImage: AssetImage(personImage),
                    )),
                SizedBox(width: deviceWidth * .03),
                Text(
                  personName,
                  style: TextStyle(
                      fontSize: deviceHeight / 55, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text('1d',
                    style: TextStyle(
                      fontSize: deviceHeight / 55,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: deviceWidth * .025, bottom: deviceWidth * .007),
                  child: Icon(
                    Icons.more_vert,
                    size: deviceHeight / 52,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight * .015),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceWidth * .035),
            child: RichText(
              text: TextSpan(children: [
                CustomTextSpan(spanText: threadDescription),
                CustomTextSpan(
                    spanText: ConstantStrings.MORE, color: Colors.blue),
              ]),
            ),
          ),
          SizedBox(height: threadImageCover != null ? deviceHeight * .01 : 0),
          threadImageCover != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: deviceWidth * .035),
                  child: Container(
                    height: deviceHeight / 7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(threadImageCover!),
                          fit: BoxFit.fill),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1),
                      borderRadius: BorderRadius.circular(deviceHeight / 70),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * .035, vertical: deviceHeight * .01),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.black,
                    size: deviceHeight / 37,
                  ),
                  SizedBox(width: deviceWidth * .025),
                  SizedBox(
                    height: deviceHeight * .032,
                    width: deviceHeight * .032,
                    child: SvgPicture.asset(
                      ConstantSvgs.IC_COMMENTS,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: deviceWidth * .025),
                  SizedBox(
                      height: deviceHeight * .025,
                      width: deviceHeight * .022,
                      child: SvgPicture.asset(
                        ConstantSvgs.IC_REPEAT,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(width: deviceWidth * .025),
                  SizedBox(
                      height: deviceHeight * .025,
                      width: deviceHeight * .025,
                      child: SvgPicture.asset(
                        ConstantSvgs.IC_SEND_DM,
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * .035),
              child: Text(
                ConstantStrings.REPLIES_AND_LIKES,
                style: TextStyle(
                    fontSize: deviceHeight / 55,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600),
              ),
            ),
          ),
          // SizedBox(height: deviceHeight * .001),
        ],
      ),
    );
  }
}
