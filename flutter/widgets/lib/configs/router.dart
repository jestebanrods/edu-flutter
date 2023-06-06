import 'package:go_router/go_router.dart';
import 'package:widgets/presentation/screens/buttons_screen.dart';
import 'package:widgets/presentation/screens/cards_screen.dart';
import 'package:widgets/presentation/screens/home_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => CardsScreen(),
    ),
  ],
);
