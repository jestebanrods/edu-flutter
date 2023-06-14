import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.pink,
  Colors.blue,
  Colors.yellow,
  Colors.brown,
  Colors.purple,
];

class AppTheme {
  final int colorTheme;
  final bool isDarkmode;

  AppTheme({
    this.colorTheme = 0,
    this.isDarkmode = false,
  });

  ThemeData getThemeData() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[colorTheme],
      );

  AppTheme copyWith({int? colorTheme, bool? isDarkmode}) => AppTheme(
        colorTheme: colorTheme ?? this.colorTheme,
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}
