import 'package:flutter/material.dart';
import 'package:instagramui/screens/notifications/notifs_controller.dart';
import 'package:instagramui/screens/notifications/widgets/custom_days_title.dart';
import 'package:instagramui/utils/constant_variables.dart';

import '../../utils/constant_strings.dart';

class NotifsScreen extends StatelessWidget {
  NotifsScreen({super.key});
  final NotifsController _controller = NotifsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          ConstantStrings.NOTIFICATIONS,
          style: TextStyle(
            fontSize: deviceHeight / 35,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: deviceHeight * .01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * .045),
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: deviceHeight / 17,
                      height: deviceHeight / 17,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 0.7, color: Colors.grey.shade300)),
                      child: const Icon(Icons.person_add_outlined)),
                  SizedBox(width: deviceWidth * .04),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ConstantStrings.FOLLOW_REQUESTS,
                            style: TextStyle(
                              fontSize: deviceHeight / 55,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(ConstantStrings.APPROVE_OR_IGNORE,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: deviceHeight / 55,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            )),
                        SizedBox(width: deviceWidth * .01),
                      ],
                    ),
                  ),
                  SizedBox(width: deviceWidth * .045),
                ],
              ),
            ),
            CustomDaysTitle(contentText: ConstantStrings.LAST_7_DAYS),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _controller.notificationsRecent.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: deviceHeight * .02),
                  child: _controller.notificationsRecent[index],
                );
              },
            ),
            CustomDaysTitle(contentText: ConstantStrings.LAST_30_DAYS),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _controller.notificationsLastThirtyDays.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: deviceHeight * .025),
                  child: _controller.notificationsLastThirtyDays[index],
                );
              },
            ),
            CustomDaysTitle(contentText: ConstantStrings.OLDER),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _controller.notificationsOlder.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: deviceHeight * .025),
                  child: _controller.notificationsOlder[index],
                );
              },
            ),
            CustomDaysTitle(contentText: ConstantStrings.SUGGESTED_FOR_YOU),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _controller.suggestions.length,
              itemBuilder: (context, index) {
                return _controller.suggestions[index];
              },
            ),
            CustomDaysTitle(
                contentText: ConstantStrings.SEE_ALL_SUGGESTIONS, color: true),
          ],
        ),
      ),
    );
  }
}
