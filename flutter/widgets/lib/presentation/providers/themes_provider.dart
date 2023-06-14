import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/theme/theme.dart';

// Simple
// final isDarkModeProvider = StateProvider<bool>((ref) => false);
// final colorThemeProvider = StateProvider<int>((ref) => 0);

// Immutable
final colorListProvider = Provider((ref) => colorList);

// Customs
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  // state
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorTheme(int indexColor) {
    state = state.copyWith(colorTheme: indexColor);
  }
}
