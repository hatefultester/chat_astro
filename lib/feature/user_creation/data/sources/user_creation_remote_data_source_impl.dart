/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:logger/logger.dart';

import '../../../../core/utils/open_ai_utils.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'user_creation_remote_data_source.dart';

class UserCreationRemoteDataSourceImpl implements UserCreationRemoteDataSource {
  final Logger _logger;
  final OpenAiUtils _openAiUtils;

  UserCreationRemoteDataSourceImpl(
      {required OpenAiUtils openAiUtils, required Logger logger})
      : _logger = logger,
        _openAiUtils = openAiUtils;

  @override
  Future<String> getUserProfileResponse(
      {required UserInfo userProfileEntity}) async {
    try {
      List<String> assistantInstruction = _getAssistantInstructions();
      List<String> userInstructions = _getUserInstructions(userProfileEntity);

      final chatResponse = await _openAiUtils.openAiRequest(
          userMessages: userInstructions,
          assistantMessages: assistantInstruction);

      return chatResponse;
    } on Exception catch (e) {
      _logger
          .e('exception during getting User profile response: ${e.toString()}');
      rethrow;
    }
  }

  List<String> _getAssistantInstructions() {
    List<String> assistantInstruction = [
      'User will submit his date of birth, time of birth and place of birth. Please provide short explanation of his astrology interpretation in his language. IMPORTANT !Return just that paragraph, it is used in astrology application!'
    ];
    return assistantInstruction;
  }

  List<String> _getUserInstructions(UserInfo userProfileEntity) {
    List<String> userInstructions = [
      'my day of birth: ${userProfileEntity.birthDate}'
          'my time of birth: ${userProfileEntity.birthTime}'
          'my birth place: ${userProfileEntity.birthPlace}'
          'my language: ${userProfileEntity.userLanguage}'
    ];
    return userInstructions;
  }
}
