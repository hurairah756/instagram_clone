// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagramui/api/firestore.dart';
import 'package:instagramui/screens/profile/profile_controller.dart';
import 'package:instagramui/screens/profile/widgets/profile_dashboard.dart';
import 'package:instagramui/utils/constant_variables.dart';

import '../../utils/constant_images.dart';
import '../../utils/constant_strings.dart';
import '../../utils/date_time.dart';
import '../../widgets/post_screen.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      ref.read(tabIndexProvider.notifier).updateIndex(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(tabIndexProvider);
    final postStream = ref.watch(firestorePostsProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth * .05,
                      vertical: deviceHeight * .01),
                  child: Row(
                    children: [
                      SizedBox(
                          width: deviceHeight / 60,
                          height: deviceHeight / 45,
                          child: SvgPicture.asset(
                            ConstantSvgs.IC_PRIVATE_ACCOUNT,
                            fit: BoxFit.fill,
                          )),
                      SizedBox(width: deviceWidth * .015),
                      Text(
                        'hurairah756',
                        style: TextStyle(
                            fontSize: deviceHeight / 35,
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: deviceHeight * .012),
                        child: SizedBox(
                          width: deviceHeight / 25,
                          height: deviceHeight / 25,
                          child: Stack(children: [
                            Positioned(
                              bottom: 0,
                              child: SizedBox(
                                width: deviceHeight / 36,
                                height: deviceHeight / 36,
                                child: SvgPicture.asset(
                                  ConstantSvgs.IC_THREADS_ICON,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Positioned(
                              left: deviceWidth * .02,
                              child: Container(
                                alignment: Alignment.center,
                                width: deviceWidth / 16,
                                height: deviceHeight / 48,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.circular(deviceHeight / 50),
                                ),
                                child: const Text(
                                  '9+',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(width: deviceWidth * .05),
                      SizedBox(
                        width: deviceHeight / 32,
                        height: deviceHeight / 32,
                        child: SvgPicture.asset(
                          ConstantSvgs.IC_SQUARE_OUTLINE,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(width: deviceWidth * .05),
                      SizedBox(
                        width: deviceHeight / 38,
                        height: deviceHeight / 28,
                        child: SvgPicture.asset(
                          ConstantSvgs.IC_MENU_ICON,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FutureBuilder(
                  future: Firebase_Firestore().getUser(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Padding(
                          padding: EdgeInsets.only(top: deviceHeight * .05),
                          child:
                              const Center(child: CircularProgressIndicator()));
                    }
                    return ProfileDashBoard(snapshot.data!);
                  },
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: deviceHeight * .07,
                      child: TabBar(
                        controller: _tabController,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.black,
                        indicator: UnderlineTabIndicator(
                          borderSide:
                              const BorderSide(width: 2.3, color: Colors.black),
                          insets:
                              EdgeInsets.symmetric(horizontal: deviceWidth / 8),
                        ),
                        tabs: [
                          SizedBox(
                            width: deviceHeight / 35,
                            height: deviceHeight / 35,
                            child: SvgPicture.asset(
                              tabIndex == 0
                                  ? ConstantSvgs.IC_GRID_FILLED
                                  : ConstantSvgs.IC_GRID_OUTLINE,
                              fit: BoxFit.fitWidth,
                              color: tabIndex == 0 ? Colors.black : Colors.grey,
                            ),
                          ),
                          SvgPicture.asset(tabIndex == 1
                              ? ConstantSvgs.IC_REELS_BOLD
                              : ConstantSvgs.IC_REELS_OUTLINE),
                          Icon(
                              tabIndex == 2
                                  ? Icons.person_pin_rounded
                                  : Icons.person_pin_outlined,
                              size: deviceHeight / 28),
                        ],
                      ),
                    ),
                    SizedBox(height: deviceHeight * .002),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          postStream.when(
                            data: (snapshot) {
                              var snapLength = snapshot.docs.length;
                              return GridView.builder(
                                padding:
                                    EdgeInsets.only(bottom: deviceHeight * .01),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2,
                                ),
                                itemCount: snapLength,
                                itemBuilder: (context, index) {
                                  var snap = snapshot.docs[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => PostScreen(
                                                    screenName:
                                                        ConstantStrings.POSTS,
                                                    imagePath: snap[
                                                        ConstantStrings
                                                            .PROFILE_IMAGE],
                                                    imageCover: snap[
                                                        ConstantStrings
                                                            .POST_IMAGE],
                                                    personName: snap[
                                                        ConstantStrings
                                                            .USERNAME],
                                                    postCaption: snap[
                                                        ConstantStrings
                                                            .CAPTION],
                                                    hoursAgo:
                                                        formatTimeDifference(
                                                            snap[ConstantStrings
                                                                    .TIME]
                                                                .toDate()),
                                                    isMe: true,
                                                  )));
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          snap[ConstantStrings.POST_IMAGE],
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                            },
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            error: (err, stack) => Text('Error: $err'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth / 15,
                              vertical: deviceHeight / 20,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  ConstantStrings.SHARE_A_MOMENT_WITH_THE_WORLD,
                                  style: TextStyle(
                                    fontSize: deviceHeight / 37,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: deviceHeight * .01),
                                Text(
                                  ConstantStrings.CREATE_YOUR_FIRST_REEL,
                                  style: TextStyle(
                                    fontSize: deviceHeight / 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth / 7,
                              vertical: deviceHeight / 20,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: deviceHeight / 8,
                                  height: deviceHeight / 8,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                      )),
                                  child: Icon(Icons.person_pin_outlined,
                                      size: deviceHeight / 13),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: deviceWidth / 6),
                                  child: Text(
                                    ConstantStrings.PHOTOS_AND_VIDEOS_OF_YOU,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: deviceHeight / 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: deviceHeight * .01),
                                Text(
                                  ConstantStrings.WHEN_PEOPLE_TAG_YOU_IN_PHOTOS,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: deviceHeight / 55,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
