/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/abstractions/failures.dart';
import '../../data/repository/user_creation_repository_impl.dart';

class ValidateUserTimeOfBirthUseCase extends UseCase<UserCreationRepositoryImpl,
    TimeOfDay, TimeOfDay?> {
  ValidateUserTimeOfBirthUseCase(
      {required super.repository, required super.logger});

  @override
  Future<Either<Failure, TimeOfDay>> call(
      TimeOfDay? params) async {
    logger.i('USER PROFILE USE CASE CALLED: ValidateUserTimeOfBirthUseCase');
    return await repository.validateUserTimeOfBirthInput(data: params);
  }
}
