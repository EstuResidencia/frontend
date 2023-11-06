import 'package:estu_residencia_app/presentation/widgets/shared/primary_button.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PrimaryButton(
              text: 'Buscar residencias',
              onPressed: () async {
                // final user = await TestUserDataSource().getUser();
                // print(user);
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
    );
  }
}
