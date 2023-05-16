/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/abstractions/failures.dart';
import '../../data/repository/user_creation_repository_impl.dart';

class ValidateUserPlaceOfBirthUseCase extends UseCase<UserCreationRepositoryImpl,
    String, String> {
  ValidateUserPlaceOfBirthUseCase(
      {required super.repository, required super.logger});

  @override
  Future<Either<Failure, String>> call(
      String params) async {
    logger.i('USER PROFILE USE CASE CALLED: ValidateUserPlaceOfBirthUseCase');
    return await repository.validateUserPlaceOfBirthInput(data: params);
  }
}
