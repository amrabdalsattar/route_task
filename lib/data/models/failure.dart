class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.errorMessagge);
}
