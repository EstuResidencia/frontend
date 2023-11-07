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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    titlePadding: const EdgeInsets.all(0),
                    content: const Text(
                      '¿Está seguro que desea cerrar sesión?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    actionsPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      TextButton(
                        onPressed: () {
                          ref.read(selectedSectionProvider.notifier).state = 0;
                          context.go('/login');
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF5E82C8),
                        ),
                        child: const Text(
                          'Si',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF5E82C8),
                        ),
                        child: const Text(
                          'No',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
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
