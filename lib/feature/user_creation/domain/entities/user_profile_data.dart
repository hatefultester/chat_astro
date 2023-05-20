/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:equatable/equatable.dart';

import 'user_profile_entity.dart';

class UserProfile extends Equatable {
  final UserInfo userInfo;
  final String chatResponse;

  const UserProfile(
      {required this.userInfo, required this.chatResponse});

  @override
  List<Object?> get props => [chatResponse, UserInfo];
}
