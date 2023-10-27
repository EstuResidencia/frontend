import 'package:estu_residencia_app/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});

  void onItemTapped(BuildContext context, WidgetRef ref, int index) {
    ref.read(selectedSectionProvider.notifier).state = index;
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
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedSection = ref.watch(selectedSectionProvider);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedSection,
      onTap: (value) => onItemTapped(context, ref, value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.build),
          label: 'Publicaciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.document_scanner),
          label: 'Solicitudes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
