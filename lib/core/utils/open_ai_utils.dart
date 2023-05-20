import 'package:dart_openai/openai.dart';
import 'dart:io';

import '../../feature/chat_detail/domain/entities/chat_message.dart';
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

  Future<String> openAiRequestCustomMessages(
      {required List<ChatMessage> messages,
      required String instruction,
      String openAiModel = 'gpt-3.5-turbo',
      double temperature = 0.2}) async {
    try {
      bool isConnected = await sessionServiceImpl.isConnected;
      if (!isConnected) {
        throw NoInternetException();
      }

      List<OpenAIChatCompletionChoiceMessageModel> openAiMessages = [];
      openAiMessages.add(
        OpenAIChatCompletionChoiceMessageModel(
            content: instruction, role: OpenAIChatMessageRole.system),
      );
      for (ChatMessage message in messages) {
        if (message.fromUser) {
          openAiMessages.add(OpenAIChatCompletionChoiceMessageModel(
            content: message.message,
            role: OpenAIChatMessageRole.user,
          ));
        } else {
          openAiMessages.add(OpenAIChatCompletionChoiceMessageModel(
            content: message.message,
            role: OpenAIChatMessageRole.assistant,
          ));
        }
      }

      final chatCompletions = await OpenAI.instance.chat.create(
        model: openAiModel,
        temperature: temperature,
        messages: openAiMessages,
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
