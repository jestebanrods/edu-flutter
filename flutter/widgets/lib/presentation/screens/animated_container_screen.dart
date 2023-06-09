import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  static String name = 'container';

  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool trigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              trigger = !trigger;
            });
          },
          child: const Icon(Icons.php)),
      body: Center(
        child: AnimatedContainer(
          height: trigger ? 300 : 200,
          width: trigger ? 200 : 300,
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
              color: trigger ? Colors.red : Colors.blue,
              borderRadius: BorderRadius.circular(20)),
          duration: const Duration(milliseconds: 500),
          child: const FlutterLogo(size: 105),
        ),
      ),
    );
  }
}
