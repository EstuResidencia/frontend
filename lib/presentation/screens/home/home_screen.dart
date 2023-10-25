import 'package:estu_residencia_app/infrastructure/datasources/test_user_datasourcer.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/primary_button.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/secondary_button.dart';
import 'package:estu_residencia_app/providers/global_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'general-home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final int selectedSection = ref.watch(selectedSectionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EstuResidencia'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PrimaryButton(
                text: 'Buscar residencias',
                onPressed: () async {
                  final user = await TestUserDataSource().getUser();
                  print(user);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SecondaryButton(
                text: 'Publicar inmueble',
                onPressed: () {
                  print('hola 2');
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedSection,
        onTap: (value) {
          ref.read(selectedSectionProvider.notifier).state = value;
          print(selectedSection);
        },
        items: [
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
      ),
    );
  }
}
