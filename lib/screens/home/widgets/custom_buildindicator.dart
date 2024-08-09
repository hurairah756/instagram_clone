import 'package:flutter/material.dart';

import '../../../utils/constant_variables.dart';

class BuildIndicator extends StatelessWidget {
  final bool isSelected;
  const BuildIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * .005),
      child: Container(
        height: isSelected ? deviceWidth * .016 : deviceWidth * .014,
        width: isSelected ? deviceWidth * .016 : deviceWidth * .014,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Colors.grey.shade300,
        ),
      ),
    );
  }
}
