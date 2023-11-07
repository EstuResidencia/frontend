import 'package:estu_residencia_app/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends ConsumerWidget {
  final int? role;

  const CustomBottomNavBar({
    super.key,
    this.role,
  });

  static List<BottomNavigationBarItem> getItems(int? role) {
    if (role == null) {
      return const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Perfil',
        ),
      ];
    }
    if (role == 1) {
      return const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Publicaciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined),
          label: 'Solicitudes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Perfil',
        ),
      ];
    } else {
      return const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined),
          label: 'Solicitudes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Perfil',
        ),
      ];
    }
  }

  void onItemTapped(BuildContext context, WidgetRef ref, int index) {
    ref.read(selectedSectionProvider.notifier).state = index;
    if (role == null) {
      switch (index) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/profile');
          break;
      }
      return;
    }
    if (role == 1) {
      switch (index) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/posts');
          break;
        case 2:
          context.go('/requests');
          break;
        case 3:
          context.go('/profile');
          break;
      }
    } else {
      switch (index) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/search');
          break;
        case 2:
          context.go('/myrequests');
          break;
        case 3:
          context.go('/profile');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedSection = ref.watch(selectedSectionProvider);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedSection,
      onTap: (value) => onItemTapped(context, ref, value),
      items: getItems(role),
    );
  }
}
