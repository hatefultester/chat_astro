/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../feature/user_creation/domain/entities/user_profile_data.dart';
import '../cache_service.dart';


class CacheServiceImpl extends GetxService implements CacheService {
  static CacheServiceImpl get to => Get.find();

  Locale? locale;

  UserProfileData? userProfileData;

  @override
  Future<void> clearCache() async {
    userProfileData = null;
  }
}
