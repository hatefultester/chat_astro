/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:get/get.dart';

import '../feature/user_profile/domain/entities/user_profile_data.dart';
import '../feature/user_profile/domain/entities/user_profile_entity.dart';

class AppCacheService extends GetxService {
  UserProfileEntity? userEntity;
  UserProfileData? userProfileData;
}
