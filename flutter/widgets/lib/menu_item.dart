import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const menuItems = <MenuItem>[
  MenuItem(
    title: 'Buttons',
    subtitle: 'Mostrar menús.',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Cards',
    subtitle: 'Mostrar tarjetas.',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicator',
    subtitle: 'Mostrar barras de progreso.',
    link: '/progress',
    icon: Icons.sync,
  ),
  MenuItem(
    title: 'Snackbars & Dialogs',
    subtitle: 'Mostrar los diferentes tipos de dialogos.',
    link: '/dialogs',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: "Animated Container",
    subtitle: "Mostar animación de contenedor.",
    link: "/container",
    icon: Icons.pin,
  ),
  MenuItem(
    title: "Checkbox & Radios",
    subtitle: "Mostar acciones de formularios.",
    link: "/checkbox",
    icon: Icons.check_box,
  ),
  MenuItem(
    title: "App Tutorial",
    subtitle: "Conoce como funcioa nuestra app.",
    link: "/tutorial",
    icon: Icons.help_outline,
  ),
  MenuItem(
    title: "Infinite Scroll",
    subtitle: "Hasta el infinito y mas allá.",
    link: "/infinite",
    icon: Icons.sort_by_alpha_outlined,
  ),
];
