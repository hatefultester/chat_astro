/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:equatable/equatable.dart';

import 'user_profile_entity.dart';

class UserProfileData extends Equatable {
  final UserProfileEntity userProfileEntity;
  final String chatResponse;

  const UserProfileData(
      {required this.userProfileEntity, required this.chatResponse});

  @override
  List<Object?> get props => [chatResponse, userProfileEntity];
}
