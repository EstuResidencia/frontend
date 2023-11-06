// ignore_for_file: use_build_context_synchronously
import 'package:estu_residencia_app/infrastructure/datasources/backend_user_datasourcer.dart';
import 'package:estu_residencia_app/presentation/views/views.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/alerts.dart';
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
    'Registro',
    'Contraseña',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final String password1 = ref.watch(password1ValueProvider);
    final String password2 = ref.watch(password2ValueProvider);
    final acceptedTerms = ref.watch(acceptedTermsProvider);
    final formKeys = <GlobalKey<FormState>>[
      ref.watch(nameFormKeyProvider),
      ref.watch(emailFormKeyProvider),
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
                  FocusManager.instance.primaryFocus?.unfocus();
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
            // Body que muestra cada uno de los pasos de registro
            Expanded(
              child: Padding(
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
            ),
            // Footer con botón de siguiente
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () async {
                    if (stepIndex < viewRoutesSteps.length - 1 &&
                        stepIndex != 1) {
                      if (stepIndex > 1) {
                        if (formKeys[stepIndex - 1].currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          context.go('/register/${stepIndex + 1}');
                        }
                      } else {
                        if (formKeys[stepIndex].currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          context.go('/register/${stepIndex + 1}');
                        }
                      }
                    } else if (stepIndex == 1) {
                      if (acceptedTerms) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.go('/register/${stepIndex + 1}');
                      }
                    } else if (stepIndex == viewRoutesSteps.length - 1) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      final bool passwordInvalid = password1 == '' ||
                          password2 == '' ||
                          password1.length != 6 ||
                          password2.length != 6 ||
                          password1 != password2;
                      if (passwordInvalid) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Ups"),
                              content: const Text(
                                'Revisa que las contraseñas sean de 6 dígitos y que coincidan',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        ref.read(userProvider.notifier).changeUser(
                              password: password1,
                            );
                        showLoaderDialog(context);
                        try {
                          await BackendUserDataSource()
                              .registerUser(ref.read(userProvider));
                          ref.read(userProvider.notifier).restoreUser();
                          Navigator.pop(context);
                          context.go('/register/complete');
                        } on PlatformException catch (e) {
                          Navigator.pop(context);
                          late String message;
                          if (e.code == '400') {
                            message =
                                'Revisa los datos ingresados y comprueba que nos estés registrado';
                          } else {
                            message =
                                'Ocurrió un error inesperado, estamos trabajando en ello';
                          }
                          showErrorDialog(context, message);
                        }
                      }
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
