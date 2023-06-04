import 'package:chat/config/theme/app_theme.dart';
import 'package:chat/presentation/providers/chat_provider.dart';
import 'package:chat/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (contect) => ChatProvider())],
      child: MaterialApp(
          title: 'Chat',
          theme: AppTheme(selectedColor: 3).theme(),
          home: ChatScreen()),
    );
  }
}
