/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';


const Color buttonBackgroundColor = Color.fromARGB(255, 0, 100, 41);

class UserDataGenerationSubmitButton extends StatelessWidget {
  final VoidCallback onSubmit;
  final String text;

  const UserDataGenerationSubmitButton({
    Key? key,
    required this.onSubmit,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: onSubmit,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(buttonBackgroundColor),  // Black background color
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(10.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                text.tr,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,  // White text color
                ),
              ),
          ),
        ),
      ),
    );
  }
}

