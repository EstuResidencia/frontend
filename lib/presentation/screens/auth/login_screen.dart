import 'package:estu_residencia_app/presentation/widgets/shared/tertiary_button.dart';
import 'package:estu_residencia_app/providers/login_validation_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  static const name = 'login-screen';

  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final GlobalKey<FormState> loginFormKey = ref.watch(loginKeyProvider);
    final TextEditingController emailTextEditingController =
        ref.watch(emailProvider);
    final TextEditingController passwordTextEditingController =
        ref.watch(passwordProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colorPalette.backgroundColor,
        systemNavigationBarDividerColor: colorPalette.backgroundColor,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: colorPalette.backgroundColor,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EstuResidencia',
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: colorPalette.primaryDarkenColor,
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  'Plataforma para la búsqueda y oferta de residencias estudiantiles',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: colorPalette.secondaryDarkenColor,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30.0),
                        const _LoginForm(),
                        const SizedBox(height: 40.0),
                        TertiaryButton(
                          text: 'Iniciar Sesión',
                          onPressed: () {
                            if (loginFormKey.currentState!.validate()) {
                              // en vez de los print, llamar funciona que hace login con
                              // estos datos y hace peticion a API
                              print(emailTextEditingController.text);
                              print(passwordTextEditingController.text);
                              context.go('/');
                            }
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextButton(
                          onPressed: () {
                            // context.go('/register/0');
                          },
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: colorPalette.secondaryDarkenColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: TextButton(
                    onPressed: () {
                      context.go('/register/0');
                    },
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: colorPalette.secondaryDarkenColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
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

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> loginFormKey = ref.watch(loginKeyProvider);
    final bool isPasswordVisible = ref.watch(passwordVisibleProvider);
    final TextEditingController emailTextEditingController =
        ref.watch(emailProvider);
    final TextEditingController passwordTextEditingController =
        ref.watch(passwordProvider);

    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailTextEditingController,
            decoration: const InputDecoration(
              hintText: 'Ingresa tu correo electrónico',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su correo';
              } else if (!value.contains('@') || !value.contains('.')) {
                return 'Por favor ingrese un correo válido';
              }
              return null;
            },
          ),
          TextFormField(
            controller: passwordTextEditingController,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Ingresa tu contraseña',
              suffix: IconButton(
                onPressed: () {
                  ref.read(passwordVisibleProvider.notifier).state =
                      !isPasswordVisible;
                },
                icon: isPasswordVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su contraseña';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
