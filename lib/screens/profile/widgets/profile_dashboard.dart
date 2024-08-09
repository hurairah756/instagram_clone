import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagramui/utils/constant_strings.dart';

import '../../../model/user_model.dart';
import '../../../utils/constant_images.dart';
import '../../../utils/constant_variables.dart';
import '../../../widgets/custom_note_avatar.dart';
import 'custom_profileBotton.dart';
import 'custom_profile_column.dart';

class ProfileDashBoard extends StatelessWidget {
  final Usermodel user;
  const ProfileDashBoard(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: deviceWidth * .015),
            CustomNoteAvatar(
              noteText: ConstantStrings.NOTE,
              userImage: user.profile,
              isNotMessenger: true,
            ),
            SizedBox(width: deviceWidth * .035),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: deviceHeight * .02),
                child: Row(
                  children: [
                    const ProfileColumn(
                      contentNo: ConstantStrings.EIGHT8,
                      contentType: ConstantStrings.USER_POSTS,
                    ),
                    SizedBox(width: deviceWidth * .07),
                    ProfileColumn(
                      contentNo: user.followers[0].toString(),
                      contentType: ConstantStrings.FOLLOWERS,
                    ),
                    SizedBox(width: deviceWidth * .05),
                    ProfileColumn(
                      contentNo: user.following[0].toString(),
                      contentType: ConstantStrings.FOLLOWINGS,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: deviceWidth * .015),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: deviceWidth * .05, vertical: deviceHeight * .005),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.username,
                style: TextStyle(
                  fontSize: deviceHeight / 53,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: deviceHeight * .005),
              Container(
                width: deviceWidth / 3.3,
                height: deviceHeight / 27,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(deviceHeight / 50),
                ),
                child: Row(
                  children: [
                    SizedBox(width: deviceWidth * .02),
                    SizedBox(
                      width: deviceHeight / 45,
                      height: deviceHeight / 45,
                      child: SvgPicture.asset(ConstantSvgs.IC_THREADS_ICON),
                    ),
                    SizedBox(width: deviceWidth * .01),
                    Text(
                      ConstantStrings.HURAIRAH756,
                      style: TextStyle(fontSize: deviceHeight / 60),
                    ),
                  ],
                ),
              ),
              Text(
                user.bio,
                style: TextStyle(
                  fontSize: deviceHeight / 53,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: deviceHeight * .01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * .035),
          child: Row(
            children: [
              SizedBox(width: deviceWidth * .001),
              Expanded(
                  child: CustomProfileButton(
                      buttonName: ConstantStrings.EDIT_PROFILE)),
              SizedBox(width: deviceWidth * .02),
              Expanded(
                  child: CustomProfileButton(
                      buttonName: ConstantStrings.SHARE_PROFILE)),
              SizedBox(width: deviceWidth * .02),
              CustomProfileButton(),
              SizedBox(width: deviceWidth * .001),
            ],
          ),
        ),
        SizedBox(height: deviceHeight * .035),
      ],
    );
  }
}
