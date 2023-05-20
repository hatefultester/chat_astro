/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/app/app_locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/impl/user_creation_controller_impl.dart';
import 'user_creation_form_tile.dart';
import 'user_creation_submit_button.dart';
import 'user_creation_validation_warning_widget.dart';

const Color borderColor = Color.fromARGB(255, 0, 118, 41);

class UserCreationFormSection extends GetView<UserCreationControllerImpl> {
  const UserCreationFormSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      UserCreationFormTile(
        onTap: () {
          controller.handleSelectBirthDate();
        },
        controller: controller.state.dateOfBirthTextEditingController,
        title: LocaleKey.DATE_OF_BIRTH_FORM_TITLE,
        hint: LocaleKey.DATE_OF_BIRTH_FORM_PLACEHOLDER_HINT,
        isValid: controller.state.isDateOfBirthValid,
      ),
      UserCreationFormTile(
        onTap: () {
          controller.handleSelectBirthTime();
        },
        controller: controller.state.timeOfBirthTextEditingController,
        title: LocaleKey.TIME_OF_BIRTH_FORM_TITLE,
        hint: LocaleKey.TIME_OF_BIRTH_FORM_PLACEHOLDER_HINT,
        isValid: controller.state.isTimeOfBirthValid,
      ),
      UserCreationFormTile(
        editable: true,
        onEdit: () {
          controller.handleBirthPlaceChanged();
        },
        controller: controller.state.placeOfBirthTextEditingController,
        title: LocaleKey.PLACE_OF_BIRTH_FORM_TITLE,
        hint: LocaleKey.PLACE_OF_BIRTH_FORM_PLACEHOLDER_HINT,
        isValid: controller.state.isPlaceOfBirthValid,
      ),
      UserCreationValidationWarningWidget(
        isVisible: controller.state.isWarningPresent,
        text: LocaleKey.USER_DATA_GENERATION_FORM_VALIDATION_WARNING,
      ),
      UserCreationSubmitButton(
        onSubmit: () {
          controller.handleSubmitButtonTapped();
        },
        text: LocaleKey.USER_DATA_GENERATION_FORM_SUBMIT_BUTTON,
      )
    ];

    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: borderColor,
              width: 8.0,
            ),
            bottom: BorderSide(
              color: borderColor,
              width: 8.0,
            ),
          ),
        ),
        child: ListView(
          children: children,
        ),
      ),
    );
  }
}
