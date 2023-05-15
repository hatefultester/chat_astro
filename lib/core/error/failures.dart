abstract class Failure {}

class NoInternetFailure extends Failure {}

class TimeoutFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class InvalidDataFailure extends Failure {}

class IOFailure extends Failure {}

class FileOperationFailure extends Failure {}

class PermissionDeniedFailure extends Failure {}

class UnexpectedFailure extends Failure {}

class UserNotFoundFailure extends Failure {}

class InvalidCredentialsFailure extends Failure {}

class UserNotAuthenticatedFailure extends Failure {}
