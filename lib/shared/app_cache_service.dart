/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../feature/user_profile/domain/entities/user_profile_data.dart';
import '../feature/user_profile/domain/entities/user_profile_entity.dart';

class AppCacheService extends GetxService {
  static AppCacheService get to => Get.find();

  Locale? locale;

  UserProfileEntity? userEntity;
  UserProfileData? userProfileData;
}
