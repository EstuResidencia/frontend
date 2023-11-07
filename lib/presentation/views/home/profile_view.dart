import 'package:estu_residencia_app/domain/entities/user.dart';
import 'package:estu_residencia_app/providers/global_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(loggedUserProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://t4.ftcdn.net/jpg/03/49/49/79/360_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.webp'),
              radius: 100,
            ),
          ),
          Text('${user?.name}', textScaleFactor: 2),
          const SizedBox(height: 10),
          Text('${user?.email}', textScaleFactor: 1.4),
          const SizedBox(height: 40),
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
            onPressed: () {
              ref.read(selectedSectionProvider.notifier).state = 0;
              context.go('/login');
            },
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
