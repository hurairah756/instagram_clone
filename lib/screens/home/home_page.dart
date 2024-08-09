// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagramui/screens/contact/messenger_page.dart';
import 'package:instagramui/screens/home/home_controller.dart';
import 'package:instagramui/screens/home/widgets/custom_buildindicator.dart';
import 'package:instagramui/screens/home/widgets/custom_content_row.dart';
import 'package:instagramui/screens/home/widgets/custom_story_suggestion.dart';
import 'package:instagramui/screens/home/widgets/custom_threads.dart';
import 'package:instagramui/screens/notifications/notifs_screen.dart';

import '../../utils/constant_images.dart';
import '../../utils/constant_strings.dart';
import '../../utils/constant_variables.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_story_column.dart';
import '../../widgets/user_post.dart';

class HomePageWidget extends ConsumerWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.read(homeControllerProvider.notifier);
    final homeState = ref.watch(homeControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(children: [
          Image.asset(
            ConstantImages.INSTAGRAM_LOGO,
            width: deviceWidth * .3,
            height: deviceHeight * .04,
            fit: BoxFit.fitHeight,
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: deviceHeight / 37,
          )
        ]),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: deviceWidth * .05),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotifsScreen(),
                  )),
                  child: Icon(
                    Icons.favorite_border_sharp,
                    color: Colors.black,
                    size: deviceHeight * .035,
                  ),
                ),
                SizedBox(width: deviceWidth * .06),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MessengerPage(),
                  )),
                  child: SizedBox(
                    height: deviceHeight * .035,
                    child: SvgPicture.asset(
                      ConstantSvgs.IC_MESSENGER,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: deviceHeight / 6.8,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.stories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: deviceWidth * .06,
                            top: deviceHeight * .012,
                            right: deviceWidth * .04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional(
                                  deviceWidth * .0028, deviceHeight * .0014),
                              children: [
                                Container(
                                    width: deviceWidth * .21,
                                    height: deviceWidth * .21,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              ConstantImages.MY_PROFILE)),
                                      shape: BoxShape.circle,
                                    )),
                                Container(
                                    width: deviceWidth * .075,
                                    height: deviceWidth * .075,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.5,
                                        )),
                                    child: Icon(
                                      Icons.add_outlined,
                                      color: Colors.white,
                                      size: deviceWidth * .05,
                                    )),
                              ],
                            ),
                            SizedBox(height: deviceHeight * .01),
                            Expanded(
                              child: Text(
                                ConstantStrings.YOUR_STORY,
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
                      final story = _controller.stories[index - 1];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 1000),
                        child: SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: deviceWidth * .025),
                              child: CustomStoryColumn(
                                personName: story.personName,
                                personImage: story.personImage,
                                width: deviceWidth * .25,
                                height: deviceWidth * .25,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              const Divider(
                color: Color(0xFFDADADA),
                thickness: 0.5,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _controller.userPosts.length,
                itemBuilder: (context, index) {
                  final userProfile = _controller.userPosts[index];
                  return UserPostWidget(
                    imagePath: userProfile.imagePath,
                    imageCover: userProfile.imageCover,
                    personName: userProfile.personName,
                    musicName: userProfile.musicName,
                    useGradientContainer: userProfile.useGradientContainer,
                    isMultipleImages: userProfile.isMultipleImages,
                    isVerified: userProfile.isVerified,
                    isSponsored: userProfile.isSponsored,
                    sliderImages: _controller.images,
                    sponsColor: userProfile.sponsColor,
                  );
                },
              ),
              Column(
                children: [
                  CustomContentRow(
                    contentTitle: ConstantStrings.THREADS,
                    isThreadContent: true,
                  ),
                  Container(
                    width: deviceWidth,
                    height: deviceHeight * .42,
                    color: Colors.grey.shade100,
                    alignment: Alignment.center,
                    child: PageView.builder(
                        padEnds: true,
                        onPageChanged: (index) => ref
                            .read(homeControllerProvider.notifier)
                            .updateThreadIndex(index),
                        itemCount: _controller.images.length,
                        itemBuilder: (context, index) {
                          final userThreads = _controller.threads[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                top: deviceHeight * .025,
                                bottom: deviceHeight * .025,
                                left: deviceHeight * .035,
                                right: deviceHeight * .035),
                            child: CustomThreads(
                              threadDescription: userThreads.threadDescription,
                              personName: userThreads.personName,
                              personImage: userThreads.personImage,
                              threadImageCover: userThreads.threadImageCover,
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: deviceHeight * .015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < _controller.threads.length; i++)
                          BuildIndicator(
                              isSelected: homeState.currentThreadIndex == i)
                      ],
                    ),
                  )
                ],
              ),
              UserPostWidget(
                imagePath: ConstantImages.PROFILE_CANDI,
                imageCover: ConstantImages.CANDI_COVER,
                useGradientContainer: true,
                personName: ConstantStrings.CANDIBYLU,
                isSponsored: true,
                sponsColor: Colors.red.shade700,
                isVerified: true,
              ),
              const Divider(
                color: Color(0xFFDADADA),
                thickness: 0.5,
              ),
              Column(
                children: <Widget>[
                  CustomContentRow(
                    contentTitle: ConstantStrings.RECENT_STORIES,
                  ),
                  SizedBox(
                    height: deviceHeight / 2.45,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: deviceWidth * .04),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _controller.userStorySuggestions.length,
                      itemBuilder: (context, index) {
                        final userStoryRecomeds =
                            _controller.userStorySuggestions[index];
                        return Padding(
                          padding: EdgeInsets.only(right: deviceWidth * .02),
                          child: CustomStorySuggestion(
                            profileImage: userStoryRecomeds.profileImage,
                            storyContent: userStoryRecomeds.storyContent,
                            personName: userStoryRecomeds.personName,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: deviceHeight * .01)
                ],
              ),
              const Divider(
                color: Color(0xFFDADADA),
                thickness: 0.5,
              ),
              UserPostWidget(
                imagePath: ConstantImages.PROFILE_CAROM,
                imageCover: ConstantImages.CAROM_COVER,
                useGradientContainer: true,
                personName: ConstantStrings.CAROMCREW,
                isSponsored: true,
              ),
              UserPostWidget(
                imagePath: ConstantImages.CELEBRITY_2,
                imageCover: ConstantImages.NATURE_FIFTH,
                personName: ConstantStrings.CELEBRITY_2_NAME,
                isSponsored: true,
              ),
              SizedBox(height: deviceHeight * .05)
            ],
          ),
        ),
      ),
    );
  }
}
