class Failure {
  final String message;
  Failure({required this.message});
}

class UserExist extends Failure {
  UserExist() : super(message: 'User exist');
}

class InternetFailure extends Failure {
  InternetFailure() : super(message: "Internet not available");
}

class ServerFailure extends Failure {
  ServerFailure()
      : super(
            message:
                "Our servers aren't responding at the moment. Please try again soon");
}

class GeneralTryAgainFailure extends Failure {
  GeneralTryAgainFailure()
      : super(message: "Something went wrong, please try again!");
}

class RequestTimeoutFailure extends Failure {
  RequestTimeoutFailure()
      : super(
            message:
                "The server took too long to respond. Please try again later.");
}

class UnidentifiedFailure extends Failure {
  UnidentifiedFailure() : super(message: "Some error occured");
}
