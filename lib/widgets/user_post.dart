import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/home/home_controller.dart';
import '../screens/home/widgets/custom_buildindicator.dart';
import '../utils/constant_images.dart';
import '../utils/constant_strings.dart';
import '../utils/constant_variables.dart';
import '../utils/utils.dart';
import 'custom_comments.dart';
import 'custom_image_container.dart';
import 'custom_story_widget.dart';

class UserPostWidget extends ConsumerStatefulWidget {
  final String personName;
  final String imagePath;
  final List<String>? sliderImages;
  String? imageCover;
  String? musicName;
  bool? useGradientContainer;
  bool? isMultipleImages;
  bool? isVerified;
  bool? isSponsored;
  Color? sponsColor;

  UserPostWidget({
    super.key,
    required this.personName,
    required this.imagePath,
    this.imageCover = ConstantImages.NATURE,
    this.sliderImages,
    this.musicName,
    this.useGradientContainer = false,
    this.isMultipleImages = false,
    this.isVerified = false,
    this.isSponsored = false,
    this.sponsColor,
  });

  @override
  ConsumerState<UserPostWidget> createState() => _UserPostWidgetState();
}

class _UserPostWidgetState extends ConsumerState<UserPostWidget>
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
    // final homeController = ref.read(homeControllerProvider.notifier);
    // final homeState = ref.watch(homeControllerProvider);

    return ProviderScope(
      overrides: [
        homeControllerProvider.overrideWith((ref) => HomeController()),
      ],
      child: Consumer(builder: (context, ref, child) {
        final homeController = ref.read(homeControllerProvider.notifier);
        final homeState = ref.watch(homeControllerProvider);
        final iconColor = ref
            .watch(homeControllerProvider.select((state) => state.iconColor));
        return SizedBox(
          width: deviceWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: deviceWidth * .04,
                    right: deviceWidth * .04,
                    bottom: deviceWidth * .03,
                    top: deviceWidth * .01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        widget.useGradientContainer!
                            ? Container(
                                alignment: Alignment.center,
                                width: deviceWidth * .115,
                                height: deviceWidth * .115,
                                child: CustomPaint(
                                    painter:
                                        GradientCirclePainter(strokeWidth: 2.0),
                                    child: Container(
                                        width: deviceWidth * .115,
                                        height: deviceWidth * .115,
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                                deviceHeight * .0062),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        widget.imagePath),
                                                  ),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade400,
                                                      width: 0.8)),
                                            )))),
                              )
                            : Container(
                                width: deviceWidth * .1,
                                height: deviceWidth * .1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        widget.imagePath,
                                      )),
                                  shape: BoxShape.circle,
                                )),
                        SizedBox(width: deviceWidth * .025),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(widget.personName,
                                    style: bodyText(
                                      fontWeight: FontWeight.w600,
                                      fontSize: deviceHeight / 53,
                                      textColor: Colors.black,
                                    )),
                                SizedBox(width: deviceWidth * .015),
                                widget.isVerified!
                                    ? SizedBox(
                                        width: deviceHeight / 58,
                                        height: deviceHeight / 58,
                                        child: Image.asset(
                                          ConstantImages.BLUE_TICK_VERIFIED,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            widget.musicName == null
                                ? const SizedBox()
                                : Row(
                                    children: [
                                      SizedBox(
                                          width: deviceHeight * .015,
                                          height: deviceHeight * .015,
                                          child: SvgPicture.asset(
                                            ConstantSvgs.IC_MUSIC_PLAYER,
                                            fit: BoxFit.fitHeight,
                                          )),
                                      SizedBox(width: deviceWidth * .015),
                                      Text(widget.musicName!,
                                          style: bodyText(
                                            fontWeight: FontWeight.normal,
                                            fontSize: deviceHeight / 65,
                                            textColor: Colors.black,
                                          )),
                                    ],
                                  ),
                            widget.isSponsored!
                                ? Text(ConstantStrings.SPONSORED,
                                    style: bodyText(
                                      fontWeight: FontWeight.normal,
                                      fontSize: deviceHeight / 65,
                                      textColor: Colors.black,
                                    ))
                                : const SizedBox()
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    widget.isSponsored!
                        ? const SizedBox.shrink()
                        : Text('2d',
                            style: bodyText(
                              fontWeight: FontWeight.normal,
                              fontSize: deviceHeight / 55,
                              textColor: Colors.grey,
                            )),
                    SizedBox(width: deviceWidth * .025),
                    Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: deviceHeight / 35,
                    ),
                  ],
                ),
              ),
              widget.isMultipleImages!
                  ? Stack(alignment: Alignment.topRight, children: [
                      SizedBox(
                        width: deviceWidth,
                        height: deviceHeight * .4,
                        child: PageView.builder(
                            onPageChanged: (index) => ref
                                .read(homeControllerProvider.notifier)
                                .updatePostIndex(index),
                            itemCount: widget.sliderImages!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: deviceWidth,
                                height: deviceHeight * .4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        widget.sliderImages![index],
                                      )),
                                  shape: BoxShape.rectangle,
                                ),
                              );
                            }),
                      ),
                      Positioned(
                        top: deviceWidth * .03,
                        right: deviceWidth * .03,
                        child: Container(
                          alignment: Alignment.center,
                          width: deviceWidth / 9,
                          height: deviceHeight / 28,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(deviceHeight / 50),
                          ),
                          child: Text(
                            '${homeState.currentPostIndex + 1}/${widget.sliderImages!.length}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceHeight / 62,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ])
                  : CustomImageContainer(
                      imageCover: widget.imageCover!,
                      iconAnimationController: _iconAnimationController,
                      isSponsored: widget.isSponsored!,
                      color: widget.sponsColor,
                    ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(deviceWidth * .045,
                    deviceWidth * .03, deviceWidth * .045, 0),
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
                                homeController.toggleIconColor();
                                // setState(() => iconColor = !iconColor);
                              }
                            },
                            child: Icon(
                              iconColor
                                  ? Icons.favorite
                                  : Icons.favorite_border_rounded,
                              color: iconColor ? Colors.red : Colors.black,
                              size: deviceHeight / 28,
                            )),
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
                            )),
                      ],
                    ),
                    widget.isMultipleImages!
                        ? Row(
                            children: [
                              for (var i = 0;
                                  i < widget.sliderImages!.length;
                                  i++)
                                BuildIndicator(
                                    isSelected: homeState.currentPostIndex == i)
                            ],
                          )
                        : const SizedBox(),
                    SizedBox(width: deviceWidth * .12),
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.black,
                      size: deviceHeight / 28,
                    ),
                  ],
                ),
              ),
              const CustomComments(),
              SizedBox(height: deviceHeight * .035),
            ],
          ),
        );
      }),
    );
  }
}
