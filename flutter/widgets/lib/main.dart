import 'package:flutter/material.dart';
import 'package:widgets/configs/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      // home: const HomeScreen(),
    );
  }
}
