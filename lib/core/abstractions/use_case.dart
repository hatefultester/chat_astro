import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import 'failures.dart';

abstract class UseCase<Repository, Result, Params> {
  final Logger logger;
  final Repository repository;

  UseCase({required this.repository, required this.logger});

  Future<Either<Failure, Result>> call(Params params);
}

class NoParams {}