import 'package:flutter/material.dart';

import '../../../utils/constant_variables.dart';
import '../../../utils/utils.dart';

class CustomActivePersons extends StatelessWidget {
  final String personName;
  final String personImage;
  const CustomActivePersons({
    super.key,
    required this.personName,
    required this.personImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: deviceHeight * .048),
        Stack(
          alignment:
              AlignmentDirectional(deviceWidth * .00245, deviceHeight * .00125),
          children: [
            ClipOval(
              child: Image.asset(
                personImage,
                width: deviceHeight / 10,
                height: deviceHeight / 10,
                fit: BoxFit.cover,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: deviceWidth * .021,
              child: CircleAvatar(
                backgroundColor: Colors.amber.shade800,
                radius: deviceWidth * .016,
              ),
            ),
          ],
        ),
        SizedBox(height: deviceHeight * .007),
        Expanded(
          child: Text(
            personName,
            style: bodyText(
              fontWeight: FontWeight.normal,
              fontSize: deviceHeight / 60,
              textColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
