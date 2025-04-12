/// Base failure class
class Failure {
  final String message;
  final StackTrace? stackTrace;

  Failure(this.message, [this.stackTrace]);

  @override
  String toString() => message;
}

/// Specific failure types for better error handling
class ServerFailure extends Failure {
  ServerFailure(String message, [StackTrace? stackTrace]) : super(message, stackTrace);
}

class AuthFailure extends Failure {
  AuthFailure(String message, [StackTrace? stackTrace]) : super(message, stackTrace);
}

class NetworkFailure extends Failure {
  NetworkFailure(String message, [StackTrace? stackTrace]) : super(message, stackTrace);
}

class CacheFailure extends Failure {
  CacheFailure(String message, [StackTrace? stackTrace]) : super(message, stackTrace);
}

class UnknownFailure extends Failure {
  UnknownFailure(String message, [StackTrace? stackTrace]) : super(message, stackTrace);
}
