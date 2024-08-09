import 'package:flutter/material.dart';

import '../../../utils/constant_variables.dart';

class CustomProfileButton extends StatelessWidget {
  String? buttonName;
  CustomProfileButton({super.key, this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: deviceHeight / 22,
      width: buttonName == null ? deviceWidth / 12 : deviceWidth / 3,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(deviceHeight / 90),
      ),
      child: buttonName == null
          ? Icon(
              Icons.person_add_outlined,
              size: deviceHeight / 42,
            )
          : Text(
              buttonName!,
              style: TextStyle(
                fontSize: deviceHeight / 55,
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }
}
