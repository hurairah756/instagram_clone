import 'package:flutter/material.dart';
import 'package:instagramui/utils/constant_strings.dart';

import '../../../utils/constant_variables.dart';

class Have extends StatelessWidget {
  const Have({super.key, required this.show});
  final VoidCallback show;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * .025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            ConstantStrings.DONT_HAVE_AN_ACCOUNT,
            style: TextStyle(
              fontSize: deviceHeight / 55,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: show,
            child: Text(
              ConstantStrings.LOGIN,
              style: TextStyle(
                  fontSize: deviceHeight / 52,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
