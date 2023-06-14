import 'package:go_router/go_router.dart';
import 'package:widgets/presentation/screens/animated_container_screen.dart';
import 'package:widgets/presentation/screens/app_tutorial.dart';
import 'package:widgets/presentation/screens/buttons_screen.dart';
import 'package:widgets/presentation/screens/cards_screen.dart';
import 'package:widgets/presentation/screens/checkbox_screen.dart';
import 'package:widgets/presentation/screens/counter_screen.dart';
import 'package:widgets/presentation/screens/dialogs_screen.dart';
import 'package:widgets/presentation/screens/home_screen.dart';
import 'package:widgets/presentation/screens/infinite_scroll_screen.dart';
import 'package:widgets/presentation/screens/progress_screen.dart';
import 'package:widgets/presentation/screens/theme_changer_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/dialogs',
      name: DialogsScreen.name,
      builder: (context, state) => const DialogsScreen(),
    ),
    GoRoute(
      path: '/container',
      name: AnimatedContainerScreen.name,
      builder: (context, state) => const AnimatedContainerScreen(),
    ),
    GoRoute(
      path: '/checkbox',
      name: CheckboxScreen.name,
      builder: (context, state) => const CheckboxScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name,
      builder: (context, state) => const AppTutorialScreen(),
    ),
    GoRoute(
      path: '/infinite',
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: '/themes',
      builder: (context, state) => const ThemeChangerScreen(),
    ),
  ],
);
