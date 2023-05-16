/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/error/failures.dart';
import '../../data/repository/impl/user_profile_repository_impl.dart';

class ValidateUserDateOfBirthUseCase extends UseCase<UserProfileRepositoryImpl,
    String, DateTime?> {
  ValidateUserDateOfBirthUseCase(
      {required super.repository, required super.logger});

  @override
  Future<Either<Failure, String>> call(
      DateTime? params) async {
    logger.i('USER PROFILE USE CASE CALLED: ValidateUserDateOfBirthUseCase');
    return await repository.validateUserDateOfBirthData(data: params);
  }
}
