import 'package:chat_astro/feature/chat_detail/presentation/chat_detail_screen.dart';
import 'package:chat_astro/feature/user_profile/domain/entities/user_profile_entity.dart';
import 'package:chat_astro/feature/user_profile/domain/use_cases/create_user_profile_data_use_case.dart';
import 'package:chat_astro/feature/user_profile/domain/use_cases/validate_user_date_of_birth_use_case.dart';
import 'package:chat_astro/feature/user_profile/domain/use_cases/validate_user_place_of_birth_use_case.dart';
import 'package:chat_astro/feature/user_profile/domain/use_cases/validate_user_time_of_birth_use_case.dart';
import 'package:chat_astro/shared/date_picker_mixin.dart';
import 'package:chat_astro/shared/time_picker_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/abstractions/base_controller.dart';
import '../../../../../shared/app_cache_service.dart';
import '../user_data_generation_controller.dart';

class UserDataGenerationControllerImpl extends BaseController
    with TimePickerMixin, DatePickerMixin
    implements UserDataGenerationController {
  final CreateUserProfileDataUseCase createUserProfileDataUseCase = Get.find();
  final ValidateUserTimeOfBirthUseCase validateUserTimeOfBirthUseCase =
      Get.find();
  final ValidateUserPlaceOfBirthUseCase validateUserPlaceOfBirthUseCase =
      Get.find();
  final ValidateUserDateOfBirthUseCase validateUserDateOfBirthUseCase =
      Get.find();

  final TextEditingController dateOfBirthTextEditingController =
      TextEditingController();
  RxBool isDateOfBirthSelected = false.obs;
  final TextEditingController timeOfBirthTextEditingController =
      TextEditingController();
  RxBool isTimeOfBirthSelected = false.obs;
  final TextEditingController placeOfBirthTextEditingController =
      TextEditingController();
  RxBool isPlaceOfBirthTyped = false.obs;

  RxBool submitResponseLoading = false.obs;
  RxBool displayWarningMessageToUser = false.obs;
  bool wasSubmitButtonTapped = false;


  @override
  void handleUserSubmitButtonTapped() async {
    if (!wasSubmitButtonTapped) {
      wasSubmitButtonTapped = true;
    }
    validateIfSubmitIsAvailable();
    if (!displayWarningMessageToUser.value) {
      final UserProfileEntity entity = parseUserProfileEntity();
      submitResponseLoading.value = true;
      final submitResult = await createUserProfileDataUseCase.call(entity);

      submitResult.fold((l) {
        submitResponseLoading.value = false;
        return;
      }, (r) {
        submitResponseLoading.value = false;
        AppCacheService.to.userProfileData = r;
        Get.to(const ChatDetailScreen());
      });
    }
  }

  @override
  void handleUserTappedOnDateOfBirthListTile() {
    showCustomDatePicker(initialDate: DateTime(2000)).then((pickedTime) async {
      final validationResult =
          await validateUserDateOfBirthUseCase.call(pickedTime);

      validationResult.fold((l) {
        return;
      }, (r) {
        dateOfBirthTextEditingController.text = r;
        isDateOfBirthSelected.value = true;
        validateIfSubmitIsAvailable();
      });
    });
  }

  @override
  void handleUserTappedOnPlaceOfBirthListTile() async {
    final text = placeOfBirthTextEditingController.value.text;
    final validationResult = await validateUserPlaceOfBirthUseCase.call(text);

    validationResult.fold((l) {
      isPlaceOfBirthTyped.value = false;
      validateIfSubmitIsAvailable();
    }, (r) {
      isPlaceOfBirthTyped.value = true;
      validateIfSubmitIsAvailable();
    });
  }

  @override
  void handleUserTappedOnTimeOfBirthListTile() {
    showCustomTimePicker().then((pickedTime) async {
      final validationResult =
          await validateUserTimeOfBirthUseCase.call(pickedTime);

      validationResult.fold((l) {
        return;
      }, (r) {
        timeOfBirthTextEditingController.text = r;
        isTimeOfBirthSelected.value = true;
        validateIfSubmitIsAvailable();
      });
    });
  }

  @override
  void validateIfSubmitIsAvailable() {
    if (!wasSubmitButtonTapped) return;
    displayWarningMessageToUser.value = !(isTimeOfBirthSelected.value &&
        isDateOfBirthSelected.value &&
        isPlaceOfBirthTyped.value);
  }

  @override
  UserProfileEntity parseUserProfileEntity() {
    return UserProfileEntity(
      birthDate: dateOfBirthTextEditingController.value.text,
      birthPlace: placeOfBirthTextEditingController.value.text,
      birthTime: timeOfBirthTextEditingController.value.text,
    );
  }
}
