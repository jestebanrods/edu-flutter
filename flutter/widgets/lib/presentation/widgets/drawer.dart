import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/menu_item.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top >= 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
          final menu = menuItems[value];
          context.push(menu.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        });
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, hasNotch ? 0 : 30, 20, 20),
          child: const Text('Menu'),
        ),
        ...menuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 20, 20),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 20, 20),
          child: Text('Ajustes'),
        ),
        ...menuItems.sublist(3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
