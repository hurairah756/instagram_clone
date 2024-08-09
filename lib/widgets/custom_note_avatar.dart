import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/constant_variables.dart';

class CustomNoteAvatar extends StatelessWidget {
  bool? isNotMessenger;
  bool? isNotMe;
  final String noteText;
  final String userImage;
  CustomNoteAvatar(
      {this.isNotMessenger = false,
      this.isNotMe = false,
      required this.noteText,
      required this.userImage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth / 3.6,
      height: deviceHeight / 6.5,
      child: Stack(
        children: [
          Positioned(
            top: deviceHeight * .049,
            left: deviceWidth * .05,
            child: ClipOval(
              child: isNotMessenger!
                  ? CachedNetworkImage(
                      imageUrl: userImage,
                      width: deviceHeight / 10,
                      height: deviceHeight / 10,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      userImage,
                      width: deviceHeight / 10,
                      height: deviceHeight / 10,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(
            top: deviceHeight * .052,
            left: isNotMe! ? deviceWidth * .08 : deviceWidth * .091,
            child: CircleAvatar(
              radius: deviceHeight * .007,
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: deviceHeight * .093,
            left: isNotMe! ? deviceWidth * .035 : deviceWidth * .055,
            child: Container(
              alignment: Alignment.center,
              width: isNotMe! ? deviceWidth / 4.2 : deviceWidth / 6.4,
              height: deviceHeight / 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(deviceHeight / 51),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 0.2,
                    spreadRadius: 0.5,
                    offset: const Offset(0, -0.5),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 0.2,
                    spreadRadius: 0.5,
                    offset: const Offset(0.5, 0),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 0.2,
                    spreadRadius: 0.5,
                    offset: const Offset(-0.5, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * .012),
                child: Text(
                  noteText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: isNotMe == null || isNotMe! == true
                          ? deviceHeight / 65
                          : deviceHeight / 55),
                ),
              ),
            ),
          ),
          Positioned(
            top: deviceHeight * .0655,
            left: isNotMe! ? deviceWidth * .103 : deviceWidth * .113,
            child: CircleAvatar(
              radius: deviceHeight * .0029,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
