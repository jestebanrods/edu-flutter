import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogsScreen extends StatelessWidget {
  static String name = 'dialogs';

  const DialogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars & Dialogs')),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbars'),
        icon: const Icon(Icons.notifications),
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Hola Mundo'),
            action: SnackBarAction(label: 'Ok', onPressed: () {}),
            duration: const Duration(seconds: 2),
          ));
        },
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton(
              onPressed: () {
                showAboutDialog(
                    context: context, children: [const Text('Hola Mundo')]);
              },
              child: const Text('Show Licences')),
          FilledButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Dialogs'),
                      content: const Text("Im Custom Dialog"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text('Cancelar')),
                        TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text('Aceptar'))
                      ],
                    );
                  },
                );
              },
              child: const Text('Show Dialogs'))
        ]),
      ),
    );
  }
}
