/*
 * Copyright (c) 2023. Created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/error/failures.dart';
import '../../data/repository/impl/user_profile_repository_impl.dart';
import '../entities/user_profile_data.dart';
import '../entities/user_profile_entity.dart';

class CreateUserProfileDataUseCase extends UseCase<UserProfileRepositoryImpl,
    UserProfileData, UserProfileEntity> {
  CreateUserProfileDataUseCase(
      {required super.repository, required super.logger});

  @override
  Future<Either<Failure, UserProfileData>> call(
      UserProfileEntity params) async {
    logger.i('USER PROFILE USE CASE CALLED: CreateUserProfileDataUseCase');
    return await repository.createUserProfileData(entity: params);
  }
}
