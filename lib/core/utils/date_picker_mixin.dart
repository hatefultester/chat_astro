/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DatePickerMixin {
  Future<DateTime?> showCustomDatePicker({required DateTime initialDate}) {
    ThemeData pickerTheme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Colors.green,  // color of the dial
        onPrimary: Colors.white,  // color of the dial hand and text
        surface: Colors.black,  // background color
        onSurface: Colors.green,  // color of the buttons
      ),
      dialogBackgroundColor: Colors.black, // dialog background color
    );

    return showDatePicker(
      context: Get.context!,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: pickerTheme,
          child: child!,
        );
      },
    );
  }
}
