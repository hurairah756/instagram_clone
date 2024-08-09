import 'package:flutter/material.dart';
import 'package:instagramui/screens/contact/widgets/custom_active_persons.dart';

import '../../utils/constant_images.dart';
import '../../utils/constant_strings.dart';

class MessengerController {
  final TextEditingController search = TextEditingController();
  List<CustomActivePersons> activePersons = [
    const CustomActivePersons(
      personName: ConstantStrings.CELEBRITY_1_NAME,
      personImage: ConstantImages.CELEBRITY_1,
    ),
    const CustomActivePersons(
      personName: ConstantStrings.CELEBRITY_2_NAME,
      personImage: ConstantImages.CELEBRITY_2,
    ),
    const CustomActivePersons(
      personName: ConstantStrings.CELEBRITY_3_NAME,
      personImage: ConstantImages.CELEBRITY_3,
    ),
    const CustomActivePersons(
      personName: ConstantStrings.CELEBRITY_4_NAME,
      personImage: ConstantImages.CELEBRITY_4,
    ),
    const CustomActivePersons(
      personName: ConstantStrings.CELEBRITY_5_NAME,
      personImage: ConstantImages.CELEBRITY_5,
    ),
    const CustomActivePersons(
      personName: ConstantStrings.CELEBRITY_6_NAME,
      personImage: ConstantImages.CELEBRITY_6,
    ),
    const CustomActivePersons(
      personName: ConstantStrings.CELEBRITY_7_NAME,
      personImage: ConstantImages.CELEBRITY_7,
    ),
  ];
}
