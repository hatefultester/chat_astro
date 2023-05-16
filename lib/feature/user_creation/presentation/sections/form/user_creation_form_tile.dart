/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double formTitleFontSize = 24;
const Color invalidEnabledBorderColor = Color.fromARGB(255, 80, 0, 0);
const Color invalidFormColor = Color.fromARGB(255, 207, 0, 1);
const Color validEnabledBorderColor = Color.fromARGB(255, 0, 58, 41);
const Color validFormColor = Color.fromARGB(255, 0, 118, 41);

class UserCreationFormTile extends StatelessWidget {
  final RxBool isValid;
  final TextEditingController controller;
  final String title;
  final String hint;
  final VoidCallback? onTap;
  final bool editable;
  final VoidCallback? onEdit;

  const UserCreationFormTile({
    Key? key,
    required this.controller,
    required this.title,
    required this.hint,
    this.onTap,
    required this.isValid,
    this.editable = false,
    this.onEdit,
  })  : assert(editable || onTap != null, 'onTap must be provided when editable is false.'),
        assert(!editable || onEdit != null, 'onEdit must be provided when editable is true.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Obx(
        () => InkWell(
          key: Key('user_creation_form_ink_well'),
          borderRadius: BorderRadius.circular(50.0),
          splashColor: isValid.value
              ? validFormColor.withOpacity(0.5)
              : invalidFormColor
                  .withOpacity(0.5),
          onTap: editable ? () {} : onTap,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                tr(title),
                style: TextStyle(
                  color: isValid.value ? validFormColor : invalidFormColor,
                  fontSize: formTitleFontSize,
                ),
              ),
            ),
            subtitle: AbsorbPointer(
              absorbing: !editable,
              child: TextField(
                onChanged: editable ? (_) => onEdit!() : null,
                decoration: InputDecoration(
                  hintText: tr(hint),
                  hintStyle: TextStyle(
                      color: isValid.value ? validFormColor : invalidFormColor),
                  prefixStyle: TextStyle(
                      color: isValid.value ? validFormColor : invalidFormColor),
                  suffixStyle: TextStyle(
                      color: isValid.value ? validFormColor : invalidFormColor),
                  filled: true,
                  fillColor:
                      const Color.fromARGB(255, 40, 40, 40), // Dark grey.
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: isValid.value
                            ? validEnabledBorderColor
                            : invalidEnabledBorderColor), // Dark red.
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: isValid.value
                            ? validFormColor
                            : invalidFormColor), // Same red as the title.
                  ),
                ),
                controller: controller,
                style: TextStyle(
                    color: isValid.value ? validFormColor : invalidFormColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
