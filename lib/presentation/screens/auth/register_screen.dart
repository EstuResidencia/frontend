import 'package:estu_residencia_app/presentation/views/views.dart';
import 'package:estu_residencia_app/providers/register_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerWidget {
  static const name = 'resgister-screen';

  final int stepIndex;

  const RegisterScreen({
    super.key,
    required this.stepIndex,
  });

  final viewRoutesSteps = const <Widget>[
    Step1NameView(),
    Step2TermsView(),
    Step3EmailView(),
    Step4PasswordView(),
  ];

  final stepTitles = const <String>[
    'Registro',
    'Parte legal',
    'Correo electrónico',
    'Contraseña',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final formKeys = <GlobalKey<FormState>>[
      ref.watch(nameFormKeyProvider),
      ref.watch(emailFormKeyProvider),
      ref.watch(telefonoFormKeyProvider),
      ref.watch(passwordFormKeyProvider),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colorPalette.backgroundColor,
        systemNavigationBarDividerColor: colorPalette.backgroundColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (stepIndex > 0) {
                    context.go('/register/${stepIndex - 1}');
                  } else {
                    context.go('/login');
                  }
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Text(
                stepTitles[stepIndex],
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: colorPalette.secondaryDarkenColor,
                ),
              ),
            ],
          ),
          backgroundColor: colorPalette.backgroundColor,
          centerTitle: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: IndexedStack(
                  index: stepIndex,
                  children: viewRoutesSteps,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () {
                    if (stepIndex < viewRoutesSteps.length - 1) {
                      if (formKeys[stepIndex].currentState!.validate()) {
                        context.go('/register/${stepIndex + 1}');
                      }
                    } else {
                      context.go('/register/complete');
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: colorPalette.primaryDarkenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 8,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: colorPalette.backgroundColor,
                    size: 42,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
