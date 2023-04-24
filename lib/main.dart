import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:pttem_flutter_template/app/init/locator.dart';
import 'package:pttem_flutter_template/app/init/theme/app_theme_provider.dart';
import 'package:pttem_flutter_template/ui/feature/sample/sample_view.dart';

import 'app/init/storage/storage_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  StorageManager.initPrefs();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<AppThemeProvider>(),
      builder: (context, value) {
        return Consumer<AppThemeProvider>(
          builder: (context, value, child) {
            return  GetMaterialApp(
            home: const SampleView(),
            theme: value.appTheme,
            enableLog: kDebugMode,
          );
          },
        );
      },
    );
  }
}
