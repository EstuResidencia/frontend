import 'package:estu_residencia_app/infrastructure/datasources/test_user_datasourcer.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/primary_button.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'general-home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EstuResidencia'),
      ),
      body: Center(
        child: Column(
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
    );
  }
}
