/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/core/utils/context_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/src/material/time.dart';
import 'package:get/get.dart';

import '../../../../../core/services/impl/cache_service_impl.dart';
import '../../../../../core/utils/dialog_utils.dart';
import '../../../../chat_detail/presentation/chat_detail_screen.dart';
import '../../../domain/entities/user_profile_data.dart';
import '../../../domain/entities/user_profile_entity.dart';
import '../user_creation_controller.dart';
import 'user_creation_controller_state.dart';

class UserCreationControllerImpl extends GetxController
    implements UserCreationController {

  final UserCreationControllerState state;
  final DialogUtils dialogUtils;
  final ContextWrapper contextWrapper;

  UserCreationControllerImpl({required this.state, required this.dialogUtils, required this.contextWrapper});

  @override
  Future<void> handleBirthPlaceChanged() async {
    final text = state.placeOfBirthTextEditingController.value.text;
    final validationResult = await state.validatePlace.call(text);

    validationResult.fold((l) {
      state.isPlaceOfBirthValid.value = false;
      validateIfSubmitIsAvailable();
    }, (r) {
      state.isPlaceOfBirthValid.value = true;
      validateIfSubmitIsAvailable();
    });
  }

  @override
  Future<void> handleSelectBirthDate() async {
    await dialogUtils.showCustomDatePicker().then((pickedTime) async {
      final validationResult = await state.validateDate.call(pickedTime);

      validationResult.fold((failure) {
        return;
      }, (validValue) {
        state.dateOfBirthTextEditingController.text = validValue;
        state.isDateOfBirthValid.value = true;
        validateIfSubmitIsAvailable();
      });
    });
  }

  @override
  Future<void> handleSelectBirthTime() async {
    await dialogUtils.showCustomTimePicker().then((pickedTime) async {
      final validationResult = await state.validateTime.call(pickedTime);

      validationResult.fold((failure) {
        return;
      }, (timeOfDay) {
        final formattedTimeOfDay =
        state.timeOfBirthTextEditingController.text = formatLocalizedTimeOfDay(timeOfDay);
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
      final UserProfileEntity entity = parseUserProfileEntity();
      final submitResult = await state.createProfile.call(entity);

      state.displayLoading();
      submitResult.fold((failure) {
        return;
      }, (userProfileData) {
        state.userProfileData = userProfileData;
        storeUserProfileDataToCache();
        navigateToDetailScreen();
      });
    }
  }

  @override
  UserProfileEntity parseUserProfileEntity() {
    return UserProfileEntity(
      userLanguage: getUserLanguage(),
      birthDate: state.dateOfBirthTextEditingController.value.text,
      birthPlace: state.placeOfBirthTextEditingController.value.text,
      birthTime: state.timeOfBirthTextEditingController.value.text,
    );
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

  @override
  String formatLocalizedTimeOfDay(TimeOfDay timeOfDay) {
    return timeOfDay.format(contextWrapper.context).toString();
  }

  @override
  String getUserLanguage() {
    return contextWrapper.context.locale.languageCode;
  }

  @override
  void storeUserProfileDataToCache() {
    CacheServiceImpl.to.userProfileData = state.userProfileData;
  }

  @override
  void navigateToDetailScreen() {
    Get.to(const ChatDetailScreen());
  }
}
