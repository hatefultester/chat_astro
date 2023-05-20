/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import '../../domain/entities/user_profile_data.dart';

abstract class UserCreationLocalDataSource {
  Future<bool> isUserProfilePresent();
  Future<bool> storeUserProfile(UserProfile userProfileData);
}