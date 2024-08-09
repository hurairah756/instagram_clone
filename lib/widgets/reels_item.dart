import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import '../screens/reels/reels_controller.dart';
import '../utils/constant_images.dart';
import '../utils/constant_variables.dart';
import 'custom_story_widget.dart';

class ReelsItem extends StatefulWidget {
  final Map<String, dynamic> reelsData;
  const ReelsItem(this.reelsData, {super.key});

  @override
  State<ReelsItem> createState() => _ReelsItemState();
}

class _ReelsItemState extends State<ReelsItem> {
  final reelsController = ReelsController();

  @override
  void initState() {
    super.initState();
    reelsController.videoPlayerController =
        VideoPlayerController.network(widget.reelsData['reelsvideo'].toString())
          ..initialize().then((value) {
            setState(() {
              reelsController.isLoading = false;
              reelsController.videoPlayerController.setLooping(true);
              reelsController.videoPlayerController.setVolume(1);
              reelsController.videoPlayerController.play();
            });
          });
  }

  @override
  void dispose() {
    super.dispose();
    reelsController.videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: () {
            setState(() => reelsController.play = !reelsController.play);
            if (reelsController.play) {
              reelsController.videoPlayerController.play();
            } else {
              reelsController.videoPlayerController.pause();
            }
          },
          child: SizedBox(
            width: deviceWidth,
            height: deviceHeight,
            child: reelsController.isLoading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.black,
                    ),
                  )
                : VideoPlayer(reelsController.videoPlayerController),
          ),
        ),
        if (!reelsController.play)
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              radius: deviceHeight / 22,
              child: Icon(
                Icons.play_arrow,
                size: deviceHeight / 20,
                color: Colors.white,
              ),
            ),
          ),
        Positioned(
          bottom: deviceHeight / 40,
          right: deviceWidth / 25,
          child: Column(
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: deviceHeight / 25,
              ),
              SizedBox(height: deviceHeight * .01),
              Text(
                'Likes',
                style: TextStyle(
                  fontSize: deviceHeight / 60,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: deviceHeight * .015),
              SizedBox(
                height: deviceHeight * .05,
                width: deviceHeight * .05,
                child: SvgPicture.asset(
                  ConstantSvgs.IC_COMMENTS,
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: deviceHeight * .01),
              Text(
                '1,380',
                style: TextStyle(
                  fontSize: deviceHeight / 60,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: deviceHeight * .025),
              SizedBox(
                height: deviceHeight * .04,
                width: deviceHeight * .04,
                child: SvgPicture.asset(
                  ConstantSvgs.IC_SEND_DM,
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: deviceHeight * .01),
              Text(
                '1.6M',
                style: TextStyle(
                  fontSize: deviceHeight / 60,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: deviceHeight * .025),
              Icon(
                Icons.more_vert_sharp,
                color: Colors.white,
                size: deviceHeight / 30,
              ),
              SizedBox(height: deviceHeight * .025),
              Container(
                width: deviceWidth * .08,
                height: deviceWidth * .08,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        widget.reelsData['profileImage'].toString()),
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(deviceHeight / 80),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: deviceHeight / 50,
          left: deviceWidth / 25,
          right: deviceWidth / 6.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomStoryWidget(
                    profilePic: widget.reelsData['profileImage'].toString(),
                    width: deviceWidth * .13,
                    height: deviceWidth * .13,
                    isStory: true,
                  ),
                  SizedBox(width: deviceWidth * .03),
                  Text(
                    widget.reelsData['username'],
                    style: TextStyle(
                      fontSize: deviceHeight / 55,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: deviceWidth * .03),
                  Container(
                    alignment: Alignment.center,
                    width: deviceWidth / 4.8,
                    height: deviceHeight / 27,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.2),
                      borderRadius: BorderRadius.circular(deviceHeight / 80),
                    ),
                    child: Text(
                      'Follow',
                      style: TextStyle(
                        fontSize: deviceHeight / 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: deviceHeight * .015),
              ExpandableText(
                widget.reelsData['caption'].toString(),
                style: TextStyle(
                  fontSize: deviceHeight / 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                expandText: 'more',
                collapseText: 'less',
                collapseOnTextTap: true,
                expandOnTextTap: true,
                maxLines: 1,
                linkColor: Colors.white,
              ),
              SizedBox(height: deviceHeight * .01),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: deviceWidth / 2.7,
                    height: deviceHeight / 31,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(deviceHeight / 60),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: deviceHeight * .015,
                          height: deviceHeight * .015,
                          child: SvgPicture.asset(
                            ConstantSvgs.IC_MUSIC_PLAYER,
                            color: Colors.white,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(width: deviceWidth * .02),
                        SizedBox(
                          height: deviceHeight * .02,
                          width: deviceWidth / 4,
                          child: MarqueeText(
                            text: TextSpan(
                                text: widget.reelsData['caption'].toString()),
                            style: TextStyle(
                              fontSize: deviceHeight / 60,
                              color: Colors.white,
                            ),
                            speed: 10,
                          ),
                          // MarqueeText(
                          //   text: widget.reelsData['caption'].toString(),
                          //   style: TextStyle(
                          //     fontSize: deviceHeight / 60,
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.w400,
                          //   ),
                          //   velocity: 25.0,
                          // ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: deviceWidth * .012),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: deviceWidth / 3.2,
                      height: deviceHeight / 31,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(deviceHeight / 60),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: deviceHeight * .02,
                            color: Colors.white,
                          ),
                          SizedBox(width: deviceWidth * .01),
                          Text(
                            widget.reelsData['username'].toString(),
                            style: TextStyle(
                              fontSize: deviceHeight / 60,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: deviceWidth * .012),
                  Container(
                    alignment: Alignment.center,
                    width: deviceWidth / 10,
                    height: deviceHeight / 31,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(deviceHeight / 60),
                    ),
                    child: Text(
                      '+1',
                      style: TextStyle(
                        fontSize: deviceHeight / 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

/*class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double velocity;

  const MarqueeText({
    super.key,
    required this.text,
    required this.style,
    required this.velocity,
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late double _textWidth;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    WidgetsBinding.instance?.addPostFrameCallback(_afterLayout);
  }

  void _afterLayout(_) {
    _calculateTextWidth();
    _startScrolling();
  }

  void _calculateTextWidth() {
    final RenderBox renderBox =
        _scrollController.position.context.storageContext.findRenderObject()
            as RenderBox;
    _textWidth = renderBox.size.width;
  }

  void _startScrolling() {
    final duration = Duration(
      milliseconds: ((_textWidth / widget.velocity) * 1000).toInt(),
    );

    _scrollController
        .animateTo(
      _scrollController.position.maxScrollExtent,
      duration: duration,
      curve: Curves.linear,
    )
        .whenComplete(() {
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      _startScrolling();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }
}*/
