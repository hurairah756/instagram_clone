import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagramui/screens/contact/messenger_controller.dart';
import 'package:instagramui/screens/contact/widgets/custom_active_persons.dart';
import 'package:instagramui/screens/contact/widgets/custom_inboxes.dart';
import 'package:instagramui/utils/constant_images.dart';
import 'package:instagramui/utils/constant_variables.dart';

import '../../utils/constant_strings.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_note_avatar.dart';
import '../../widgets/custom_search_box.dart';

class MessengerPage extends StatelessWidget {
  MessengerPage({super.key});
  final MessengerController _controller = MessengerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
        title: Row(
          children: [
            Text(ConstantStrings.HURAIRAH756,
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: deviceHeight / 33)),
            const Icon(Icons.keyboard_arrow_down_outlined),
          ],
        ),
        actions: [
          SizedBox(
              width: deviceWidth * .075,
              height: deviceWidth * .075,
              child: SvgPicture.asset(
                ConstantSvgs.IC_EDIT_PENCIL,
                fit: BoxFit.fitHeight,
              )),
          SizedBox(width: deviceWidth * .05),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: deviceHeight * .01),
            CustomMetaSearchBox(search: _controller.search),
            SizedBox(height: deviceHeight * .025),
            SizedBox(
              height: deviceHeight / 5.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _controller.activePersons.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(left: deviceWidth * .025),
                      child: Column(
                        children: [
                          CustomNoteAvatar(
                            noteText: ConstantStrings.NOTE,
                            userImage: ConstantImages.MY_PROFILE_PIC,
                          ),
                          SizedBox(height: deviceHeight * .001),
                          Padding(
                            padding: EdgeInsets.only(left: deviceWidth * .035),
                            child: Text(
                              ConstantStrings.YOUR_NOTE,
                              style: bodyText(
                                fontWeight: FontWeight.normal,
                                fontSize: deviceHeight / 60,
                                textColor: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (index == 1) {
                    final active = _controller.activePersons[index - 1];
                    return Padding(
                      padding: EdgeInsets.only(right: deviceWidth * .05),
                      child: Column(
                        children: [
                          CustomNoteAvatar(
                            noteText: ConstantStrings.SALAM,
                            userImage: active.personImage,
                            isNotMe: true,
                          ),
                          SizedBox(height: deviceHeight * .001),
                          Padding(
                            padding: EdgeInsets.only(left: deviceWidth * .035),
                            child: Text(
                              ConstantStrings.CELEBRITY_1_NAME,
                              style: bodyText(
                                fontWeight: FontWeight.normal,
                                fontSize: deviceHeight / 60,
                                textColor: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    final active = _controller.activePersons[index - 1];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: EdgeInsets.only(right: deviceWidth * .065),
                            child: CustomActivePersons(
                              personName: active.personName,
                              personImage: active.personImage,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: deviceWidth * .045,
                    vertical: deviceHeight * .015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ConstantStrings.MESSAGES,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: deviceHeight / 47)),
                    Text(ConstantStrings.REQUESTS,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: deviceHeight / 47)),
                  ],
                )),
            ListView.builder(
              padding: EdgeInsets.only(bottom: deviceHeight * .025),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _controller.activePersons.length,
              itemBuilder: (context, index) {
                final status = _controller.activePersons[index];
                if (index == 0) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: CustomInboxes(
                        personImage: status.personImage,
                        personName: status.personName,
                        reelName: ConstantStrings.SENT_REELS,
                      ),
                    ),
                  );
                } else if (index == 2) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: CustomInboxes(
                        personImage: status.personImage,
                        personName: status.personName,
                        isStory: true,
                      ),
                    ),
                  );
                } else {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: CustomInboxes(
                        personImage: status.personImage,
                        personName: status.personName,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
