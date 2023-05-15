import '../../domain/entities/user_profile_entity.dart';
import '../model/user_profile_response.dart';

abstract class UserProfileRemoteDataSource {
  Future<String> getUserProfileResponse(
      {required UserProfileEntity userProfileEntity});
}
