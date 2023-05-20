/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/core/utils/open_ai_utils.dart';
import 'package:logger/logger.dart';

import '../../../domain/entities/chat_message.dart';
import '../chat_detail_remote_data_source.dart';

class ChatDetailRemoteDataSourceImpl implements ChatDetailRemoteDataSource {
  final Logger _logger;
  final OpenAiUtils _openAiUtils;

  ChatDetailRemoteDataSourceImpl(
      {required OpenAiUtils openAiUtils, required Logger logger})
      : _logger = logger,
        _openAiUtils = openAiUtils;

  @override
  Future<String> getChatResponse({required List<ChatMessage> messages}) async {
    try {
      const String instruction = """
      Write as a astrology expert, response in user language of choice and also be friendly, use emojis and try to be empatic and spiritual. Act like astrology expert
      """;
      final chatResponse =
          await _openAiUtils.openAiRequestCustomMessages(messages: messages, instruction: instruction);
      return chatResponse;
    } on Exception catch (e) {
      _logger.e('exception during getting message response: ${e.toString()}');
      rethrow;
    }
  }
}
