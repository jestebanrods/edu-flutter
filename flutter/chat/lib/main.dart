import 'package:chat/config/theme/app_theme.dart';
import 'package:chat/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: AppTheme(selectedColor: 3).theme(),
      home: ChatScreen()
    );
  }
}
