
import 'package:flutter/foundation.dart';

import 'exception_logger_impl.dart';

class DebugExceptionLogger implements ExceptionLoggerImpl {
  @override
  Future<void> captureException(dynamic exception, {stackTrace, Map<String, dynamic>? extra}) async {
    if (kDebugMode) print(exception);
  }

  @override
  Future<void> captureInfoMessage(String message, {Map<String, dynamic>? extra}) async {
    if (kDebugMode) print("info: $message");
  }
}
