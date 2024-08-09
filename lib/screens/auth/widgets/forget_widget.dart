import 'package:flutter/material.dart';
import 'package:instagramui/utils/constant_strings.dart';

import '../../../utils/constant_variables.dart';

class Forget extends StatelessWidget {
  const Forget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: deviceWidth * .025),
        child: GestureDetector(
          onTap: () {},
          child: Text(
            ConstantStrings.FORGOT_PASSWORD,
            style: TextStyle(
              fontSize: deviceHeight / 55,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
