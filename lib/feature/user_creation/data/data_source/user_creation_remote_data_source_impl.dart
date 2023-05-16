/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import '../../../../core/utils/open_ai_utils.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'user_creation_remote_data_source.dart';

class UserCreationRemoteDataSourceImpl
    implements UserCreationRemoteDataSource {
  final OpenAiUtils openAiUtils;

  UserCreationRemoteDataSourceImpl({required this.openAiUtils});

  @override
  Future<String> getUserProfileResponse(
      {required UserProfileEntity userProfileEntity}) async {
    try {
      List<String> userInstructions = [
        'my day of birth: ${userProfileEntity.birthDate}'
            'my time of birth: ${userProfileEntity.birthTime}'
            'my birth place: ${userProfileEntity.birthPlace}'
            'my language: ${userProfileEntity.userLanguage}'
      ];

      List<String> assistantInstruction = [
        'User will submit his date of birth, time of birth and place of birth. Please provide detailed explanatory long paragraph of his astrology interpretation in his language. IMPORTANT !Return just that paragraph, it is used in astrology application!'
      ];

      final chatResponse = await openAiUtils.openAiRequest(
          userMessages: userInstructions,
          assistantMessages: assistantInstruction);

      return chatResponse;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
