/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import '../../../user_creation/domain/entities/user_profile_data.dart';

abstract class ChatDetailLocalDataSource {
  Future<UserProfile> getUserProfile();
}
