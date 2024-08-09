import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagramui/widgets/custom_story_widget.dart';

import '../screens/home/home_controller.dart';
import '../utils/constant_images.dart';
import '../utils/constant_variables.dart';
import '../utils/utils.dart';
import 'custom_comments.dart';
import 'custom_image_container.dart';

class PostScreen extends ConsumerStatefulWidget {
  final String screenName;
  final String personName;
  final String imagePath;
  final String imageCover;
  final String postCaption;
  final String hoursAgo;
  final bool isMe;

  const PostScreen({
    super.key,
    required this.screenName,
    required this.personName,
    required this.imagePath,
    required this.imageCover,
    required this.postCaption,
    required this.hoursAgo,
    required this.isMe,
  });

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen>
    with TickerProviderStateMixin {
  late AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _iconAnimationController.addListener(() {
      if (_iconAnimationController.isCompleted) {
        _iconAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        homeControllerProvider.overrideWith((ref) => HomeController()),
      ],
      child: Consumer(builder: (context, ref, child) {
        final homeController = ref.read(homeControllerProvider.notifier);
        final iconColor = ref
            .watch(homeControllerProvider.select((state) => state.iconColor));
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              widget.screenName,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: deviceWidth,
                height: deviceHeight * .74,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: deviceWidth * .04,
                          right: deviceWidth * .04,
                          bottom: deviceWidth * .03,
                          top: deviceWidth * .025),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              widget.isMe
                                  ? CircleAvatar(
                                      radius: deviceWidth * .045,
                                      backgroundImage:
                                          NetworkImage(widget.imagePath),
                                    )
                                  : CustomStoryWidget(
                                      profilePic: widget.imagePath,
                                      width: deviceWidth * .125,
                                      height: deviceWidth * .125,
                                      isStory: true),
                              SizedBox(width: deviceWidth * .035),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        widget.personName,
                                        style: bodyText(
                                          fontWeight: FontWeight.w600,
                                          fontSize: deviceHeight / 52,
                                          textColor: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: deviceWidth * .02),
                                      widget.isMe
                                          ? const SizedBox.shrink()
                                          : SizedBox(
                                              width: deviceHeight / 55,
                                              height: deviceHeight / 55,
                                              child: Image.asset(
                                                ConstantImages
                                                    .BLUE_TICK_VERIFIED,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    ],
                                  ),
                                  widget.isMe
                                      ? const SizedBox.shrink()
                                      : Text(
                                          widget.postCaption,
                                          style: bodyText(
                                            fontWeight: FontWeight.normal,
                                            fontSize: deviceHeight / 55,
                                            textColor: Colors.black,
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          widget.isMe
                              ? const SizedBox.shrink()
                              : Container(
                                  alignment: Alignment.center,
                                  width: deviceWidth / 4.8,
                                  height: deviceHeight / 24,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(
                                        deviceHeight / 80),
                                  ),
                                  child: Text(
                                    'Follow',
                                    style: TextStyle(
                                      fontSize: deviceHeight / 52,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                          SizedBox(width: deviceWidth * .025),
                          Icon(
                            Icons.more_vert,
                            color: Colors.black,
                            size: deviceHeight / 35,
                          ),
                        ],
                      ),
                    ),
                    CustomImageContainer(
                      imageCover: widget.imageCover,
                      iconAnimationController: _iconAnimationController,
                      isUserPost: true,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          deviceWidth * .045,
                          deviceWidth * .03,
                          deviceWidth * .045,
                          0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (_iconAnimationController.isCompleted) {
                                    _iconAnimationController.reverse();
                                  } else {
                                    _iconAnimationController.forward();
                                  }
                                  homeController.toggleIconColor();
                                },
                                child: Icon(
                                  iconColor
                                      ? Icons.favorite
                                      : Icons.favorite_border_rounded,
                                  color: iconColor ? Colors.red : Colors.black,
                                  size: deviceHeight / 28,
                                ),
                              ),
                              SizedBox(width: deviceWidth * .04),
                              SizedBox(
                                height: deviceHeight * .035,
                                child: SvgPicture.asset(
                                  ConstantSvgs.IC_COMMENTS,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: deviceWidth * .04),
                              SizedBox(
                                height: deviceHeight * .035,
                                child: SvgPicture.asset(
                                  ConstantSvgs.IC_SEND_DM,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.bookmark_border,
                            color: Colors.black,
                            size: deviceHeight / 28,
                          ),
                        ],
                      ),
                    ),
                    CustomComments(widget: widget),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
