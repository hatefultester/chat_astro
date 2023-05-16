/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCreationValidationWarningWidget extends StatelessWidget {
  final RxBool isVisible;
  final String text;

  const UserCreationValidationWarningWidget({super.key,
    required this.isVisible,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Visibility(
        visible: isVisible.value,
        child: ListTile(
          title: Center(
            child: Text(
              tr(text),
              style: const TextStyle(
                color: Colors.red, // red color for warning
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

