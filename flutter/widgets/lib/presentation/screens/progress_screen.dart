import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static String name = 'progress';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicator')),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text('Circular Progress Indicator'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(height: 10),
          const Text('Linear Progress Indicator'),
          const LinearProgressIndicator(),
          const SizedBox(height: 10),
          const Text('Progress Controller'),
          StreamBuilder<Object>(
              stream:
                  Stream.periodic(const Duration(milliseconds: 200), (value) {
                return value * 2 / 100;
              }).takeWhile((value) => value < 100),
              builder: (context, snapshot) {
                final double progressValue = snapshot.data as double? ?? 0.0;

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: progressValue,
                        strokeWidth: 2,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: LinearProgressIndicator(
                        value: progressValue,
                      ))
                    ],
                  ),
                );
              }),
        ],
      )),
    );
  }
}
