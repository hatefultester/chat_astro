/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/impl/user_data_generation_controller_impl.dart';
import '../widgets/user_data_generation_form_tile.dart';
import '../widgets/user_data_generation_submit_button.dart';
import '../widgets/user_data_generation_validation_warning_widget.dart';

const Color borderColor = Color.fromARGB(255, 0, 118, 41);

class UserDataGenerationSubmitFormSection
    extends GetView<UserDataGenerationControllerImpl> {
  const UserDataGenerationSubmitFormSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: borderColor, // Specify the color of the border here
              width: 8.0, // Specify the thickness of the border here
            ),
            bottom: BorderSide(
              color: borderColor, // Specify the color of the border here
              width: 8.0, // Specify the thickness of the border here
            ),
          ),
        ),
        child: ListView(
          children: [
            UserDataGenerationFormTile(
              onTap: () {
                controller.handleUserTappedOnDateOfBirthListTile();
              },
              controller: controller.dateOfBirthTextEditingController,
              title: 'date_of_birth_form_title',
              hint: 'date_of_birth_form_placeholder_hint',
              isValid: controller.isDateOfBirthSelected,
            ),
            UserDataGenerationFormTile(
              onTap: () {
                controller.handleUserTappedOnTimeOfBirthListTile();
              },
              controller: controller.timeOfBirthTextEditingController,
              title: 'time_of_birth_form_title',
              hint: 'time_of_birth_form_placeholder_hint',
              isValid: controller.isTimeOfBirthSelected,
            ),
            UserDataGenerationFormTile(
              editable: true,
              onEdit: () {
                controller.handleUserTappedOnPlaceOfBirthListTile();
              },
              controller: controller.placeOfBirthTextEditingController,
              title: 'place_of_birth_form_title',
              hint: 'place_of_birth_form_placeholder_hint',
              isValid: controller.isPlaceOfBirthTyped,
            ),
            UserDataGenerationValidationWarningWidget(
              isVisible: controller.displayWarningMessageToUser,
              text: 'user_data_generation_form_validation_warning',
            ),
            UserDataGenerationSubmitButton(
              onSubmit: () {
                controller.handleUserSubmitButtonTapped();
              },
              text: 'user_data_generation_form_submit_button',
            )
          ],
        ),
      ),
    );
  }
}
