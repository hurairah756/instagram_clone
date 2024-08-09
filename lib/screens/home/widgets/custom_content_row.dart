import 'package:flutter/material.dart';

import '../../../utils/constant_images.dart';
import '../../../utils/constant_strings.dart';
import '../../../utils/constant_variables.dart';
import '../../../utils/utils.dart';

class CustomContentRow extends StatelessWidget {
  final String contentTitle;
  bool? isThreadContent;
  CustomContentRow({
    super.key,
    required this.contentTitle,
    this.isThreadContent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: deviceWidth * .04,
          right: deviceWidth * .04,
          bottom: isThreadContent! ? deviceWidth * .03 : 0,
          top: deviceWidth * .01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isThreadContent!
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        width: deviceWidth * .1,
                        height: deviceWidth * .1,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                ConstantImages.THREADS_CIRCLE,
                              )),
                          shape: BoxShape.circle,
                        )),
                    SizedBox(width: deviceWidth * .025),
                    Text(contentTitle,
                        style: bodyText(
                          fontWeight: FontWeight.w600,
                          fontSize: deviceHeight / 53,
                          textColor: Colors.black,
                        )),
                  ],
                )
              : Text(contentTitle,
                  style: bodyText(
                    fontWeight: FontWeight.bold,
                    fontSize: deviceHeight / 53,
                    textColor: Colors.black,
                  )),
          const Spacer(),
          isThreadContent!
              ? Text(ConstantStrings.OPEN_APP,
                  style: bodyText(
                    fontWeight: FontWeight.w600,
                    fontSize: deviceHeight / 52,
                    textColor: Colors.blue,
                  ))
              : const SizedBox(),
          SizedBox(width: deviceWidth * .025),
          Icon(
            Icons.more_vert,
            color: Colors.black,
            size: deviceHeight / 35,
          ),
        ],
      ),
    );
  }
}
