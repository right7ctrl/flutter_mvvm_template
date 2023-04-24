import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void unfocus(BuildContext context) {
  final scope = FocusScope.of(context);
  if (scope.hasFocus) scope.unfocus();
}

void hideKeyboard([BuildContext? context]) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  if (context != null) unfocus(context);
}


void nextTick(Function callback, [int milliseconds = 0]) {
  SchedulerBinding.instance.addPostFrameCallback((_) => callback());
}


