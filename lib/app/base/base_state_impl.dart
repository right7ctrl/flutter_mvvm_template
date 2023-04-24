import 'package:flutter/material.dart';

abstract class BaseStateImpl<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);
  MediaQueryData get mediaQuery => MediaQuery.of(context);
  Size get size => mediaQuery.size;
}
