import 'package:flutter/material.dart';
import 'package:instagramui/utils/constant_strings.dart';
import 'package:instagramui/utils/constant_variables.dart';

Future<void> dialogBuilder(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          ConstantStrings.ERROR,
          style: TextStyle(
              fontSize: deviceHeight / 55, fontWeight: FontWeight.bold),
        ),
        content: Text(
          message,
          style: TextStyle(fontSize: deviceHeight / 55),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(ConstantStrings.OK),
          ),
        ],
      );
    },
  );
}
