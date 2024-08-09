import 'package:flutter/material.dart';

import '../../../utils/constant_variables.dart';

class CustomDaysTitle extends StatelessWidget {
  final String contentText;
  bool? color;
  CustomDaysTitle({
    super.key,
    required this.contentText,
    this.color = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: deviceWidth * .045,
          right: deviceWidth * .045,
          top: color! ? deviceHeight * .02 : deviceHeight * .03,
          bottom: color! ? deviceHeight * .025 : deviceHeight * .012),
      child: Text(contentText,
          style: TextStyle(
            fontSize: deviceHeight / 46,
            fontWeight: FontWeight.w500,
            color: color! ? Colors.blue : Colors.black,
          )),
    );
  }
}
