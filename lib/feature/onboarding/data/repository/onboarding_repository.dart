import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../model/user_data.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, bool>> hasOnboardingBeenShown();
  Future<Either<Failure, UserData>> fetchUserData();
  Future<Either<Failure, void>> setOnboardingShown();
}