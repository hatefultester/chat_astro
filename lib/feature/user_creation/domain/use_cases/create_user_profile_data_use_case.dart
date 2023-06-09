/*
 * Copyright (c) 2023. Created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/abstractions/failures.dart';
import '../../data/repository/user_creation_repository_impl.dart';
import '../entities/user_profile_data.dart';
import '../entities/user_profile_entity.dart';

class CreateUserProfileDataUseCase extends UseCase<UserCreationRepositoryImpl,
    UserProfile, UserInfo> {
  CreateUserProfileDataUseCase(
      {required super.repository, required super.logger});

  @override
  Future<Either<Failure, UserProfile>> call(
      UserInfo params) async {
    logger.i('USER PROFILE USE CASE CALLED: CreateUserProfileDataUseCase');
    return await repository.createUserProfileData(entity: params);
  }
}
