import 'package:flutter/material.dart';
import 'package:pttem_flutter_template/app/base/helper/busy_error_state_helper.dart';

class BaseViewModel extends ChangeNotifier with BusyAndErrorStateHelper {
  BaseViewModel() {
    init();
  }

  void init() {}
}
