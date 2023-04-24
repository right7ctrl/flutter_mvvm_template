import '../locator.dart';
import 'api_exception.dart';
import 'logger/exception_logger.dart';

class ApiResponse<T> {
  late ApiResponseStatus status;
  T? data;
  String? message;
  dynamic exception;
  
  ApiResponse.idle() : status = ApiResponseStatus.idle;
  ApiResponse.loading() : status = ApiResponseStatus.loading;
  ApiResponse.success(this.data) : status = ApiResponseStatus.success;

  ApiResponse.error(this.message, this.exception, StackTrace stackTrace, {bool logException = true}) {
    if (exception != null && exception is UnauthorizedException) {
      status = ApiResponseStatus.unAuthorized;
    } else {
      status = ApiResponseStatus.error;
    }
    if (logException) {
      locator<ExceptionLogger>().captureException(exception, stackTrace: stackTrace);
    }
  }

  bool get isIdle => status == ApiResponseStatus.idle;
  bool get isLoading => status == ApiResponseStatus.loading;
  bool get isError => (status == ApiResponseStatus.error || status == ApiResponseStatus.unAuthorized);
  bool get isUnauthorized => status == ApiResponseStatus.unAuthorized;
  bool get isSuccess => status == ApiResponseStatus.success;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum ApiResponseStatus { idle, loading, success, error, unAuthorized }
