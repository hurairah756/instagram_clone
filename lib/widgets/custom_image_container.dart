import 'package:flutter/material.dart';

import '../utils/constant_variables.dart';

class CustomImageContainer extends StatelessWidget {
  CustomImageContainer({
    super.key,
    required this.imageCover,
    this.isUserPost,
    this.isSponsored = false,
    this.color,
    required AnimationController iconAnimationController,
  }) : _iconAnimationController = iconAnimationController;

  final String imageCover;
  final AnimationController _iconAnimationController;
  bool? isUserPost;
  bool? isSponsored;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: deviceWidth,
          height: isSponsored! ? deviceHeight * .6 : deviceHeight * .4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: isUserPost == null
                  ? AssetImage(
                      imageCover,
                    )
                  : NetworkImage(imageCover),
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        if (isSponsored!)
          Positioned(
            bottom: 0,
            child: Container(
              width: deviceWidth,
              height: deviceHeight * .055,
              color: color ?? Colors.blueGrey.shade600,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * .03),
                child: Row(
                  children: [
                    Text(color == null ? 'Visit Instagram profile' : 'Shop now',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: deviceHeight / 54,
                          color: Colors.white,
                        )),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: deviceHeight * .018,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: _iconAnimationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _iconAnimationController.value,
                child: Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                  size: deviceHeight / 7,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
