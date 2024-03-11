class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No internet');
}

class RequestTimeoutEception extends AppException {
  RequestTimeoutEception([String? message]) : super(message, 'Timeout');
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Something went wrong');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal server error');
}
