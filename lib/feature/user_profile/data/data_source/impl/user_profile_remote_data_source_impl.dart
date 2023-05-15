import 'package:chat_astro/feature/user_profile/data/data_source/user_profile_remote_data_source.dart';
import 'package:chat_astro/feature/user_profile/data/model/user_profile_response.dart';
import 'package:chat_astro/feature/user_profile/domain/entities/user_profile_entity.dart';

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {

  @override
  Future<UserProfileResponse> getUserProfileResponse({required UserProfileEntity userProfileEntity}) {
    // TODO: implement getUserProfileResponse
    throw UnimplementedError();
  }

}