
import 'debug_exception_logger.dart';
import 'exception_logger_impl.dart';

class ExceptionLogger {
  late List<ExceptionLoggerImpl> _loggers;

  ExceptionLogger() {
    _loggers = [
      DebugExceptionLogger(),
      //SentryExceptionLogger(),
      //CrashlyticsExceptionLogger(),
    ];
  }

  Future<void> captureException(dynamic exception, {dynamic stackTrace, Map<String, dynamic>? extra}) async {
    await Future.wait(_loggers.map((item) => item.captureException(exception, stackTrace: stackTrace, extra: extra)).toList());
  }

  Future<void> captureInfoMessage(String message, {Map<String, dynamic>? extra}) async {
    await Future.wait(_loggers.map((item) => item.captureInfoMessage(message, extra: extra)).toList());
  }
}
