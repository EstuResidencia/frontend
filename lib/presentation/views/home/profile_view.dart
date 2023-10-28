import 'package:estu_residencia_app/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref ) {

    final User userData = ref.watch(userProvider);
    

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              radius: 100,
            ),
          ),
          Text('${userData.email}', textScaleFactor: 1.4),
          const Text('Nombre pepito perez'),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.announcement_rounded),
            label: const Text('Reportar inconvenientes'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.assignment_outlined),
            label: const Text('Términos y condiciones'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.policy_outlined),
            label: const Text('Política de privacidad de datos'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            label: const Text(
              'Cerrar sesión',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
