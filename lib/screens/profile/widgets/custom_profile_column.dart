import 'package:flutter/material.dart';

import '../../../utils/constant_variables.dart';

class ProfileColumn extends StatelessWidget {
  final String contentNo;
  final String contentType;
  const ProfileColumn(
      {super.key, required this.contentNo, required this.contentType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          contentNo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: deviceHeight / 42,
          ),
        ),
        Text(
          contentType,
          style: TextStyle(
            fontSize: deviceHeight / 52,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
