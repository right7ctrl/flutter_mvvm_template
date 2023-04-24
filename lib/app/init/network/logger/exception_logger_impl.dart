
abstract class ExceptionLoggerImpl {
  Future<void> captureException(dynamic exception, {dynamic stackTrace, Map<String, dynamic>? extra});
  Future<void> captureInfoMessage(String message, {Map<String, dynamic>? extra});
}