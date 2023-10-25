import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Inicio',
    subTitle: 'Página de inicio',
    link: '/',
    icon: Icons.home,
  ),
  MenuItem(
    title: 'Perfil',
    subTitle: 'Perfil de usuario',
    link: '/profile',
    icon: Icons.person,
  ),
  MenuItem(
    title: 'Configuración',
    subTitle: 'Configuración de la aplicación',
    link: '/settings',
    icon: Icons.settings,
  ),
  MenuItem(
    title: 'Cerrar sesión',
    subTitle: 'Cerrar sesión de la aplicación',
    link: '/logout',
    icon: Icons.logout,
  ),
];
