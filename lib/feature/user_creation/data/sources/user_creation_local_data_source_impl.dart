/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import '../../../../core/services/impl/session_service_impl.dart';
import '../../domain/entities/user_profile_data.dart';
import 'user_creation_local_data_source.dart';

class UserCreationLocalDataSourceImpl implements UserCreationLocalDataSource {
  final SessionServiceImpl sessionServiceImpl;

  UserCreationLocalDataSourceImpl({required this.sessionServiceImpl});

  @override
  Future<bool> isUserProfilePresent() async {
    return sessionServiceImpl.userProfileData != null;
  }

  @override
  Future<bool> storeUserProfile(UserProfile userProfileData) async {
    sessionServiceImpl.userProfileData = userProfileData;
    return true;
  }
}