import 'package:flutter/material.dart';

import '../../../utils/constant_variables.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final bool color;
  const CustomButton({
    super.key,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: deviceHeight / 18,
      width: deviceWidth / 2.5,
      decoration: BoxDecoration(
        color: color ? Colors.blue : Colors.white,
        border: Border.all(
          color: color ? Colors.blue : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(deviceHeight / 60),
      ),
      child: Text(
        name,
        style: TextStyle(
            fontSize: deviceHeight / 50,
            color: color ? Colors.white : Colors.grey.shade700),
      ),
    );
  }
}
