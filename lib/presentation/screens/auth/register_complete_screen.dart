import 'package:estu_residencia_app/presentation/widgets/shared/tertiary_button.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterCompleteScreen extends ConsumerWidget {
  static const name = 'resgister-complete-screen';

  const RegisterCompleteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colorPalette.backgroundColor,
        systemNavigationBarDividerColor: colorPalette.backgroundColor,
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¡Completaste el registro!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: colorPalette.primaryDarkenColor,
                  ),
                ),
                const SizedBox(height: 30.0),
                Icon(
                  Icons.check_circle_outline_rounded,
                  size: 100.0,
                  color: colorPalette.primaryDarkenColor,
                ),
                const SizedBox(height: 60.0),
                Text(
                  '¡Bienvenido a EstuResidencia!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: colorPalette.secondaryDarkenColor,
                  ),
                ),
                const SizedBox(height: 20.0),
                TertiaryButton(
                  text: 'Iniciar Sesión',
                  onPressed: () {
                    context.go('/login');
                  },
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Ahora puedes iniciar sesión con tu correo y contraseña',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: colorPalette.secondaryDarkenColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
