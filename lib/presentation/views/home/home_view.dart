import 'package:estu_residencia_app/domain/entities/user.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/primary_button.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/secondary_button.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/tertiary_button.dart';
import 'package:estu_residencia_app/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(loggedUserProvider);
    final int? role = user?.role;

    late Widget viewToShow;

    if (role == null) {
      viewToShow = const _NewUserView();
    } else if (role == 1) {
      viewToShow = const _OwnerUserView();
    } else {
      viewToShow = const _StudentUserView();
    }

    return viewToShow;
  }
}

class _NewUserView extends StatelessWidget {
  const _NewUserView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿Qué deseas hacer?', textScaleFactor: 2.2),
            const SizedBox(height: 20),
            PrimaryButton(
              text: 'Buscar residencias',
              onPressed: () {
                context.go('/validate/2');
              },
            ),
            const SizedBox(height: 10),
            SecondaryButton(
              text: 'Publicar inmueble',
              onPressed: () {
                context.go('/validate/1');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OwnerUserView extends ConsumerWidget {
  const _OwnerUserView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(loggedUserProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text('Hola, ${user?.name}', textScaleFactor: 2.2),
                )
              ],
            ),
            const SizedBox(height: 40),
            const Text('¿Qué deseas hacer?', textScaleFactor: 1.5),
            const SizedBox(height: 6),
            TertiaryButton(
              text: 'Publicar inmueble',
              onPressed: () {
                context.go('/publish/0');
              },
            ),
            const SizedBox(height: 40),
            SecondaryButton(
              text: 'Ver mis publicaciones',
              onPressed: () {
                ref.read(selectedSectionProvider.notifier).state = 1;
                context.go('/posts');
              },
            ),
            const SizedBox(height: 6),
            PrimaryButton(
              text: 'Ver Solicitudes',
              onPressed: () {
                ref.read(selectedSectionProvider.notifier).state = 2;
                context.go('/requests');
              },
            )
          ],
        ),
      ),
    );
  }
}

class _StudentUserView extends ConsumerWidget {
  const _StudentUserView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(loggedUserProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text('Hola, ${user?.name}', textScaleFactor: 2.2),
                )
              ],
            ),
            const SizedBox(height: 40),
            const Text('¿Qué deseas hacer?', textScaleFactor: 1.5),
            const SizedBox(height: 6),
            TertiaryButton(
              text: 'Buscar Residencia',
              onPressed: () {
                ref.read(selectedSectionProvider.notifier).state = 1;
                context.go('/search');
              },
            ),
            const SizedBox(height: 40),
            SecondaryButton(
              text: 'Ver mis solicitudes',
              onPressed: () {
                ref.read(selectedSectionProvider.notifier).state = 2;
                context.go('/myrequests');
              },
            ),
          ],
        ),
      ),
    );
  }
}
