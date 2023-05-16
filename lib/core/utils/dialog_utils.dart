/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'context_wrapper.dart';

class DialogUtils {
  final ContextWrapper contextWrapper;

  DialogUtils({required this.contextWrapper});

  ThemeData get pickerTheme => ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: Colors.green,
      onPrimary: Colors.white,
      surface: Colors.black,
      onSurface: Colors.green,
    ),
    dialogBackgroundColor: Colors.black,
  );

  Future<DateTime?> showCustomDatePicker() {
    final DateTime initialDate = DateTime(2000);
    final DateTime firstDate = DateTime(1900);
    final DateTime lastDate = DateTime.now();

    return showDatePicker(
      context: contextWrapper.context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: pickerTheme,
          child: child!,
        );
      },
    );
  }

  Future<TimeOfDay?> showCustomTimePicker() {
    return showTimePicker(
      context: contextWrapper.context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: pickerTheme,
          child: child!,
        );
      },
    );
  }
}