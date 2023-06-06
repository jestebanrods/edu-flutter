import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static String name = 'buttons';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(title: const Text('Buttons')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.exit_to_app),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                const ElevatedButton(
                    onPressed: null, child: Text('Elevated Disable')),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.link),
                    label: const Text('Elevated Icon')),
                FilledButton(onPressed: () {}, child: const Text('Filled')),
                FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check_sharp),
                    label: const Text('Filled Icon')),
                OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
                OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.tty),
                    label: const Text('Outlined Icon')),
                TextButton(onPressed: () {}, child: const Text('Text')),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.hub),
                    label: const Text('Text Icon')),
                IconButton(onPressed: () {}, icon: const Icon(Icons.shop)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shop),
                  style: ButtonStyle(
                      iconColor: const MaterialStatePropertyAll(Colors.white),
                      backgroundColor:
                          MaterialStatePropertyAll(colors.primary)),
                ),
              ],
            ),
          ),
        ));
  }
}
