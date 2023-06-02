import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.blue
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 1})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colors themes must be beteen 0 and ${_colorThemes.length}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark
    );
  }
}
