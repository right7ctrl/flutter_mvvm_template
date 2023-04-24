import 'package:flutter/material.dart';
import 'package:pttem_flutter_template/app/init/storage/storage_manager.dart';

enum ThemeMode { light, dark }

class AppThemeProvider with ChangeNotifier {
   ThemeMode? themeMode;

  AppThemeProvider() {
    final mode = StorageManager.getThemeMode() ?? 'light';
    if (mode != null && mode == 'light') {
      themeMode = ThemeMode.light;
      return;
    }
    ThemeMode.dark;
  }

  ThemeData get appTheme => isLightTheme ? lightTheme : darkTheme;
  bool get isLightTheme => themeMode == ThemeMode.light;

  void toggleTheme() {
    StorageManager.setThemeMode(isLightTheme ? 'dark' : 'light');
    themeMode = isLightTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  final lightTheme = ThemeData(
    primaryColor: const Color.fromRGBO(255, 171, 1, 1.000),
    accentColor: const Color.fromRGBO(58, 57, 71, 1),
    scaffoldBackgroundColor: Color.fromARGB(255, 223, 220, 232),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color.fromRGBO(39, 36, 49, 1),
      centerTitle: true,
      iconTheme: IconThemeData(color: Color.fromRGBO(240, 238, 244, 1)),
      titleTextStyle: TextStyle(color: Color.fromRGBO(240, 238, 244, 1), fontSize: 18, fontWeight: FontWeight.w700),
    ),
  );

  final darkTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 109, 77, 12),
    accentColor: Color.fromARGB(255, 90, 79, 233),
    scaffoldBackgroundColor: const Color.fromRGBO(39, 36, 49, 1),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color.fromRGBO(39, 36, 49, 1),
      centerTitle: true,
      iconTheme: IconThemeData(color: Color.fromRGBO(240, 238, 244, 1)),
      titleTextStyle: TextStyle(color: Color.fromRGBO(240, 238, 244, 1), fontSize: 18, fontWeight: FontWeight.w700),
    ),
  );
}
