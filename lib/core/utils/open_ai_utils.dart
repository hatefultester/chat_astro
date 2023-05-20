import 'package:dart_openai/openai.dart';
import 'dart:io';

import '../abstractions/exceptions.dart';
import '../services/impl/session_service_impl.dart';

class OpenAiUtils {
  final SessionServiceImpl sessionServiceImpl;

  OpenAiUtils({required this.sessionServiceImpl});

  Future<String> openAiRequest(
      {required List<String> userMessages,
      required List<String> assistantMessages,
      String openAiModel = 'gpt-3.5-turbo',
      double temperature = 0.2}) async {
    try {
      bool isConnected = await sessionServiceImpl.isConnected;
      if (!isConnected) {
        throw NoInternetException();
      }

      final chatCompletions = await OpenAI.instance.chat.create(
        model: openAiModel,
        temperature: temperature,
        messages: [
          for (var assistantMessage in assistantMessages)
            OpenAIChatCompletionChoiceMessageModel(
                role: OpenAIChatMessageRole.assistant,
                content: assistantMessage),
          for (var userMessage in userMessages)
            OpenAIChatCompletionChoiceMessageModel(
                role: OpenAIChatMessageRole.user, content: userMessage),
        ],
      );

      return chatCompletions.choices.first.message.content;
    } on SocketException {
      throw NoInternetException();
    } on HttpException {
      throw ServerException();
    } on TimeoutException {
      throw TimeoutException();
    } catch (e) {
      throw UnexpectedException();
    }
  }
}
