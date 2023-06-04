import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/app_theme.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: true, create: (context) => DiscoverProvider()..loadNextPage())
      ],
      child: MaterialApp(
        title: 'TokTik',
        theme: AppTheme().getTheme(),
        home: const Scaffold(
          body: DiscoverScreen(),
        ),
      ),
    );
  }
}
