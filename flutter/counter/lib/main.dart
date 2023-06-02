import 'package:counter/presentation/screens/counter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
        home: const CounterScreen());
  }
}
