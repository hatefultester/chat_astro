/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/user_creation/domain/entities/user_profile_data.dart';
import 'package:chat_astro/feature/user_creation/domain/use_cases/store_user_data_to_session_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/use_cases/create_user_profile_data_use_case.dart';
import '../../../domain/use_cases/validate_user_date_of_birth_use_case.dart';
import '../../../domain/use_cases/validate_user_place_of_birth_use_case.dart';
import '../../../domain/use_cases/validate_user_time_of_birth_use_case.dart';

class UserCreationControllerState {
  final CreateUserProfileDataUseCase createProfile;
  final ValidateUserTimeOfBirthUseCase validateTime;
  final ValidateUserPlaceOfBirthUseCase validatePlace;
  final ValidateUserDateOfBirthUseCase validateDate;
  final StoreUserDataToSessionUseCase storeUserData;

  final TextEditingController dateOfBirthTextEditingController =
      TextEditingController();
  final TextEditingController timeOfBirthTextEditingController =
      TextEditingController();
  final TextEditingController placeOfBirthTextEditingController =
      TextEditingController();

  late final UserProfile userProfileData;

  RxBool isDateOfBirthValid = false.obs;
  RxBool isTimeOfBirthValid = false.obs;
  RxBool isPlaceOfBirthValid = false.obs;

  RxBool isLoadingPresent = false.obs;
  RxBool isWarningPresent = false.obs;

  bool wasSubmitButtonTapped = false;

  UserCreationControllerState({
    required this.createProfile,
    required this.validateTime,
    required this.validatePlace,
    required this.validateDate,
    required this.storeUserData,
  });

  dismissLoading() => isLoadingPresent.value = false;
  dismissWarning() => isWarningPresent.value = false;

  displayLoading() => isLoadingPresent.value = true;
  displayWarning() => isWarningPresent.value = true;
}
