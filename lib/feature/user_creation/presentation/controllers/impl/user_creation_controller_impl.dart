/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/core/utils/context_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/dialog_utils.dart';
import '../../../../chat_detail/presentation/chat_detail_screen.dart';
import '../../../domain/entities/user_profile_entity.dart';
import '../user_creation_controller.dart';
import 'user_creation_controller_state.dart';

class UserCreationControllerImpl extends GetxController
    implements UserCreationController {
  final UserCreationControllerState state;
  final DialogUtils dialogUtils;
  final ContextWrapper contextWrapper;

  UserCreationControllerImpl(
      {required this.state,
      required this.dialogUtils,
      required this.contextWrapper});

  @override
  String formatLocalizedTimeOfDay(TimeOfDay timeOfDay) =>
      timeOfDay.format(contextWrapper.context).toString();

  @override
  String getUserLanguage() => contextWrapper.context.locale.languageCode;

  @override
  Future<void> handleBirthPlaceChanged() async {
    final text = state.placeOfBirthTextEditingController.value.text;

    final birthPlaceValidationResult = await state.validatePlace.call(text);

    birthPlaceValidationResult.fold((failure) {
      state.isPlaceOfBirthValid.value = false;
      validateIfSubmitIsAvailable();
    }, (result) {
      state.isPlaceOfBirthValid.value = true;
      validateIfSubmitIsAvailable();
    });
  }

  @override
  Future<void> handleSelectBirthDate() async {
    await dialogUtils.showCustomDatePicker().then((pickedTime) async {
      final birthDataValidationResult =
          await state.validateDate.call(pickedTime);

      birthDataValidationResult.fold((failure) {
        return;
      }, (result) {
        state.dateOfBirthTextEditingController.text = result;
        state.isDateOfBirthValid.value = true;
        validateIfSubmitIsAvailable();
      });
    });
  }

  @override
  Future<void> handleSelectBirthTime() async {
    await dialogUtils.showCustomTimePicker().then((pickedTime) async {
      final birthTimeValidationResult =
          await state.validateTime.call(pickedTime);

      birthTimeValidationResult.fold((failure) {
        return;
      }, (result) {
        state.timeOfBirthTextEditingController.text =
            formatLocalizedTimeOfDay(result);
        state.isTimeOfBirthValid.value = true;
        validateIfSubmitIsAvailable();
      });
    });
  }

  @override
  Future<void> handleSubmitButtonTapped() async {
    if (!state.wasSubmitButtonTapped) {
      state.wasSubmitButtonTapped = true;
    }

    validateIfSubmitIsAvailable();
    bool isFormValid = !state.isWarningPresent.value;

    if (isFormValid) {
      state.displayLoading();
      final UserInfo entity = parseUserProfileEntity();
      final submitResult = await state.createProfile.call(entity);

      state.displayLoading();

      submitResult.fold(
        (failure) {
          return;
        },
        (userProfileData) {
          state.userProfileData = userProfileData;
          storeUserProfileDataToCache();
        },
      );
    }
  }

  @override
  void navigateToDetailScreen() => Get.to(() => const ChatDetailScreen());

  @override
  UserInfo parseUserProfileEntity() => UserInfo(
        userLanguage: getUserLanguage(),
        birthDate: state.dateOfBirthTextEditingController.value.text,
        birthPlace: state.placeOfBirthTextEditingController.value.text,
        birthTime: state.timeOfBirthTextEditingController.value.text,
      );

  @override
  void storeUserProfileDataToCache() async {
    final storingResult = await state.storeUserData.call(state.userProfileData);

    storingResult.fold((l) {
      return;
    }, (r) {
      navigateToDetailScreen();
    });
  }

  @override
  void validateIfSubmitIsAvailable() {
    final bool areFieldsValid = state.isTimeOfBirthValid.value &&
        state.isDateOfBirthValid.value &&
        state.isPlaceOfBirthValid.value;

    if (state.wasSubmitButtonTapped && !areFieldsValid) {
      state.displayWarning();
    } else {
      state.dismissWarning();
    }
  }
}
