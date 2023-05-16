/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import '../../domain/entities/user_profile_entity.dart';

abstract class UserDataGenerationController{
  void handleUserTappedOnDateOfBirthListTile();
  void handleUserTappedOnTimeOfBirthListTile();
  void handleUserTappedOnPlaceOfBirthListTile();
  void handleUserSubmitButtonTapped();
  void validateIfSubmitIsAvailable();
  UserProfileEntity parseUserProfileEntity();
}