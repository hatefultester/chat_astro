/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/user_creation/domain/entities/user_profile_data.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/user_profile_entity.dart';

abstract class UserCreationController {
  String formatLocalizedTimeOfDay(TimeOfDay timeOfDay);
  String getUserLanguage();
  void handleBirthPlaceChanged();
  void handleSelectBirthDate();
  void handleSelectBirthTime();
  void handleSubmitButtonTapped();
  void navigateToDetailScreen();
  UserProfileEntity parseUserProfileEntity();
  void storeUserProfileDataToCache();
  void validateIfSubmitIsAvailable();
}
