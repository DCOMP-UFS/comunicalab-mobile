class FailureConsts {
  static const SERVERERROR = 'Ops.. Ocorreu um erro';
}

abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  @override
  String message;
  ConnectionError(this.message);
}

class ServerError extends Failure {
  @override
  String message;
  ServerError(this.message);
}
