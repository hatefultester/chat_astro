/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/error/failures.dart';
import '../../data/repository/impl/user_profile_repository_impl.dart';

class ValidateUserPlaceOfBirthUseCase extends UseCase<UserProfileRepositoryImpl,
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
