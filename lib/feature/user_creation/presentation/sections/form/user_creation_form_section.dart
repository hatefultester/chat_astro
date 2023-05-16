/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/impl/user_creation_controller_impl.dart';
import 'user_creation_form_tile.dart';
import 'user_creation_submit_button.dart';
import 'user_creation_validation_warning_widget.dart';

const Color borderColor = Color.fromARGB(255, 0, 118, 41);

class UserCreationFormSection
    extends GetView<UserCreationControllerImpl> {
  const UserCreationFormSection({Key? key}) : super(key: key);

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
            UserCreationFormTile(
              onTap: () {
                controller.handleSelectBirthDate();
              },
              controller: controller.state.dateOfBirthTextEditingController,
              title: 'date_of_birth_form_title',
              hint: 'date_of_birth_form_placeholder_hint',
              isValid: controller.state.isDateOfBirthValid,
            ),
            UserCreationFormTile(
              onTap: () {
                controller.handleSelectBirthTime();
              },
              controller: controller.state.timeOfBirthTextEditingController,
              title: 'time_of_birth_form_title',
              hint: 'time_of_birth_form_placeholder_hint',
              isValid: controller.state.isTimeOfBirthValid,
            ),
            UserCreationFormTile(
              editable: true,
              onEdit: () {
                controller.handleBirthPlaceChanged();
              },
              controller: controller.state.placeOfBirthTextEditingController,
              title: 'place_of_birth_form_title',
              hint: 'place_of_birth_form_placeholder_hint',
              isValid: controller.state.isPlaceOfBirthValid,
            ),
            UserCreationValidationWarningWidget(
              isVisible: controller.state.isWarningPresent,
              text: 'user_data_generation_form_validation_warning',
            ),
            UserCreationSubmitButton(
              onSubmit: () {
                controller.handleSubmitButtonTapped();
              },
              text: 'user_data_generation_form_submit_button',
            )
          ],
        ),
      ),
    );
  }
}
