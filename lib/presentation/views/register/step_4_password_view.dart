import 'package:estu_residencia_app/providers/register_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

final isPass1VisibleProvider = StateProvider((ref) => false);
final isPass2VisibleProvider = StateProvider((ref) => false);

class Step4PasswordView extends ConsumerWidget {
  const Step4PasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final bool isPasswordVisible = ref.watch(isPass1VisibleProvider);
    final bool isPassword2Visible = ref.watch(isPass2VisibleProvider);
    final GlobalKey<FormState> passwordFormKey =
        ref.watch(passwordFormKeyProvider);

    return Form(
      key: passwordFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          Text(
            'Crea la contraseña para entrar a tu cuenta',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: colorPalette.secondaryDarkenColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OtpTextField(
                      numberOfFields: 6,
                      mainAxisAlignment: MainAxisAlignment.start,
                      borderWidth: 3,
                      fieldWidth: 30,
                      obscureText: !isPasswordVisible,
                      enabledBorderColor: colorPalette.secondaryDarkenColor,
                      borderColor: colorPalette.primaryDarkenColor,
                      focusedBorderColor: colorPalette.primaryDarkenColor,
                      onSubmit: (String verificationCode) {
                        ref.read(password1ValueProvider.notifier).state =
                            verificationCode;
                        print(ref.read(password1ValueProvider));
                      }, // end onSubmit
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: 240,
                      child: Text(
                        'Tu contraseña debe ser de 6 dígitos y la usarás únicamente para entrar a la app.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.normal,
                          color: colorPalette.secondaryDarkenColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(isPass1VisibleProvider.notifier).state =
                      !isPasswordVisible;
                },
                icon: isPasswordVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            'Confirma tu contraseña',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: colorPalette.secondaryDarkenColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OtpTextField(
                      numberOfFields: 6,
                      mainAxisAlignment: MainAxisAlignment.start,
                      borderWidth: 3,
                      fieldWidth: 30,
                      obscureText: !isPassword2Visible,
                      enabledBorderColor: colorPalette.secondaryDarkenColor,
                      borderColor: colorPalette.primaryDarkenColor,
                      focusedBorderColor: colorPalette.primaryDarkenColor,
                      onSubmit: (String verificationCode) {
                        ref.read(password2ValueProvider.notifier).state =
                            verificationCode;
                        print(ref.read(password2ValueProvider));
                      }, // end onSubmit
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(isPass2VisibleProvider.notifier).state =
                      !isPassword2Visible;
                },
                icon: isPassword2Visible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            ],
          ),
        ],
      ),
    );
  }
}
