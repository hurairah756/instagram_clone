import 'package:flutter/material.dart';
import 'package:instagramui/widgets/post_screen.dart';

import '../utils/constant_images.dart';
import '../utils/constant_strings.dart';
import '../utils/constant_variables.dart';
import '../utils/utils.dart';

class CustomComments extends StatelessWidget {
  const CustomComments({
    super.key,
    this.widget,
  });

  final PostScreen? widget;

  @override
  Widget build(BuildContext context) {
    List randomImages = [
      ConstantImages.CELEBRITY_1,
      ConstantImages.CELEBRITY_2,
      ConstantImages.CELEBRITY_4,
    ];
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          deviceWidth * .045, deviceWidth * .03, deviceWidth * .045, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  SizedBox(width: deviceWidth * .015),
                  for (int i = 0; i < randomImages.length; i++)
                    Align(
                      widthFactor: 0.6,
                      child: CircleAvatar(
                        radius: deviceWidth * .037,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: deviceWidth * .029,
                          backgroundImage: AssetImage(randomImages[i]),
                        ),
                      ),
                    )
                ],
              ),
              SizedBox(width: deviceWidth * .03),
              RichText(
                text: TextSpan(
                  children: [
                    CustomTextSpan(spanText: ConstantStrings.LIKED_BY),
                    CustomTextSpan(
                        spanText: ConstantStrings.ID,
                        fontWeight: FontWeight.w600),
                    CustomTextSpan(spanText: ConstantStrings.AND),
                    CustomTextSpan(
                        spanText: ConstantStrings.OTHERS,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: deviceHeight * .01),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    CustomTextSpan(
                        spanText: ConstantStrings.ID,
                        fontWeight: FontWeight.w600),
                    CustomTextSpan(spanText: ConstantStrings.EXPERIENCE_DEC),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: deviceHeight * .01),
          Text(
            ConstantStrings.VIEW_ALL_COMMENTS,
            style: bodyText(
              fontWeight: FontWeight.normal,
              textColor: Colors.grey,
              fontSize: deviceHeight / 55,
            ),
          ),
          SizedBox(height: deviceHeight * .01),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: deviceWidth * .075,
                    height: deviceWidth * .075,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: widget != null
                            ? NetworkImage(widget!.imagePath)
                            : const AssetImage(ConstantImages.MY_PROFILE),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: deviceWidth * .025),
                  Text(
                    ConstantStrings.ADD_COMMENT,
                    style: bodyText(
                      fontWeight: FontWeight.normal,
                      textColor: Colors.grey,
                      fontSize: deviceHeight / 60,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(ConstantStrings.COMMENTS_EMOJI,
                  style: bodyText(
                      fontWeight: FontWeight.normal,
                      fontSize: deviceHeight / 60)),
            ],
          ),
          SizedBox(height: deviceHeight * .01),
          Text(
            widget != null ? widget!.hoursAgo : ConstantStrings.HOURS_AGO,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: deviceHeight / 60,
            ),
          ),
        ],
      ),
    );
  }
}
