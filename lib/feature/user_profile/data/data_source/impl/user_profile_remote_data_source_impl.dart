import 'package:chat_astro/feature/user_profile/data/data_source/user_profile_remote_data_source.dart';
import 'package:chat_astro/feature/user_profile/domain/entities/user_profile_entity.dart';
import 'package:chat_astro/shared/open_ai_communication_mixin.dart';
import 'package:get/get.dart';

class UserProfileRemoteDataSourceImpl
    with OpenAiCommunicationMixin
    implements UserProfileRemoteDataSource {
  @override
  Future<String> getUserProfileResponse(
      {required UserProfileEntity userProfileEntity}) async {
    try {
      List<String> userInstructions = [
        'my day of birth: ${userProfileEntity.birthDate}'
        'my time of birth: ${userProfileEntity.birthTime}'
        'my birth place: ${userProfileEntity.birthPlace}'
        'my language: ${Get.locale!.languageCode}'
      ];

      List<String> assistantInstruction = [
        'User will submit his date of birth, time of birth and place of birth. Please provide him paragraph of his astrology interpretation in his language. IMPORTANT !Return just that paragraph, it is used in astrology application!'
      ];

      final chatResponse = await openAiRequest(
          userMessages: userInstructions, assistantMessages: assistantInstruction);

      return chatResponse;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
