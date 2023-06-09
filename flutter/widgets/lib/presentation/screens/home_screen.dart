import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/menu_item.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Widgets'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final colors = Theme.of(context).colorScheme;
          return ListTile(
            leading: SizedBox(
              height: double.infinity,
              child: Icon(
                menuItems[index].icon,
                color: colors.primary,
              ),
            ),
            trailing: const Icon(Icons.arrow_right),
            title: Text(menuItems[index].title),
            subtitle: Text(menuItems[index].subtitle),
            onTap: () {
              context.push(menuItems[index].link);
            },
          );
        },
      ),
    );
  }
}
