import 'package:chat_astro/feature/user_profile/domain/entities/user_profile_entity.dart';
import 'package:equatable/equatable.dart';

class UserProfileData extends Equatable {
  final UserProfileEntity userProfileEntity;
  final String chatResponse;

  const UserProfileData({required this.userProfileEntity, required this.chatResponse});

  @override
  List<Object?> get props => [chatResponse, userProfileEntity];

}