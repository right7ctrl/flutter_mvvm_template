abstract class ApiException implements Exception {
  final String? message;

  ApiException([this.message]);
}

class FetchDataException extends ApiException {
  FetchDataException([String? message]) : super(message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([message]) : super(message);
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message);
}
