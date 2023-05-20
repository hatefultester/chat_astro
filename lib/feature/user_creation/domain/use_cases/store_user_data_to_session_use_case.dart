/*
 * Copyright (c) 2023. Created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/abstractions/failures.dart';
import '../../data/repository/user_creation_repository_impl.dart';
import '../entities/user_profile_data.dart';

class StoreUserDataToSessionUseCase extends UseCase<UserCreationRepositoryImpl,
    bool, UserProfile> {
  StoreUserDataToSessionUseCase(
      {required super.repository, required super.logger});

  @override
  Future<Either<Failure, bool>> call(
      UserProfile params) async {
    logger.i('USER PROFILE USE CASE CALLED: StoreUserDataToSessionUseCase');
    return await repository.storeUserProfileDataToSession(userProfileData: params);
  }
}
