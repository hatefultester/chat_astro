/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


const Color buttonBackgroundColor = Color.fromARGB(255, 0, 100, 41);

class UserCreationSubmitButton extends StatelessWidget {
  final VoidCallback onSubmit;
  final String text;

  const UserCreationSubmitButton({
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
                tr(text),
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

