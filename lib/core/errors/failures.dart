abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class InvalidInputFailure extends Failure {}

class UnAuthenticatedFailure extends Failure {}

class UnAuthorizedFailure extends Failure {}

class UnknownFailure extends Failure {}

class NoInternetFailure extends Failure {}