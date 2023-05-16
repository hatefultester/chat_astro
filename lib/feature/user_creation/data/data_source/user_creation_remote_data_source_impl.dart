/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

import '../../../../../shared/app_cache_service.dart';
import '../../../../../shared/open_ai_communication_mixin.dart';
import '../../../domain/entities/user_profile_entity.dart';
import '../user_profile_remote_data_source.dart';

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
            'my language: ${AppCacheService.to.locale?.languageCode}'
      ];

      List<String> assistantInstruction = [
        'User will submit his date of birth, time of birth and place of birth. Please provide detailed explanatory long paragraph of his astrology interpretation in his language. IMPORTANT !Return just that paragraph, it is used in astrology application!'
      ];

      final chatResponse = await openAiRequest(
          userMessages: userInstructions,
          assistantMessages: assistantInstruction);

      return chatResponse;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
