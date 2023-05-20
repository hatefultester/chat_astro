/*
 * Copyright (c) 2023. Created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/chat_detail/data/repository/impl/chat_detail_repository_impl.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/abstractions/failures.dart';


class ChatDetailValidateUserMessageUseCase
    extends UseCase<ChatDetailRepositoryImpl, bool, String> {
  ChatDetailValidateUserMessageUseCase(
      {required super.repository, required super.logger});

  @override
  Future<Either<Failure, bool>> call(String params) async {
    logger.i('CHAT DETAIL USE CASE CALLED: ChatDetailValidateUserMessageUseCase');
    return await repository.validateUserMessage(params);
  }
}
