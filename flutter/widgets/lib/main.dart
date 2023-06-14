import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/configs/router.dart';
import 'package:widgets/presentation/providers/themes_provider.dart';
import 'package:widgets/theme/theme.dart';

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isDarkmode = ref.watch(isDarkModeProvider);
    // final colorTheme = ref.watch(colorThemeProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Widgets',
      routerConfig: router,
      theme: appTheme.getThemeData(),
      // home: const HomeScreen(),
    );
  }
}
