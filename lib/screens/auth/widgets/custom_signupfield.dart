import 'package:flutter/material.dart';

import '../../../utils/constant_variables.dart';

class CustomSignupTextField extends StatelessWidget {
  const CustomSignupTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.typename,
    required this.icon,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final String typename;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * .025),
      child: TextField(
        style: TextStyle(fontSize: deviceHeight / 50, color: Colors.black),
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: typename,
          hintStyle: TextStyle(fontSize: deviceHeight / 45),
          prefixIcon: Icon(
            icon,
            color: focusNode.hasFocus ? Colors.black : Colors.grey[500],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: deviceHeight / 80),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(deviceHeight / 100),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(deviceHeight / 100),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
