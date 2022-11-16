import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ligth = ThemeData.light().copyWith(
    colorScheme:
        const ColorScheme.light().copyWith(primary: const Color(0xff00e5ac)),
    primaryColor: const Color(0xff00e5ac),
    scaffoldBackgroundColor: const Color(0xfff1f1f1),
    pageTransitionsTheme:
        PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      ...ThemeData.light().pageTransitionsTheme.builders,
      TargetPlatform.android: const CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: const CupertinoPageTransitionsBuilder(),
    }),
  );
}
