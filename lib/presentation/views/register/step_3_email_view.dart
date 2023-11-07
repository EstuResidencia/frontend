import 'package:estu_residencia_app/providers/register_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step3EmailView extends ConsumerWidget {
  const Step3EmailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final GlobalKey<FormState> emailFormKey = ref.watch(emailFormKeyProvider);
    final TextEditingController emailTextEditingController =
        ref.watch(emailProviderController);
    final TextEditingController telefonoTextEditingController =
        ref.watch(telefonoProviderController);

    return Form(
      key: emailFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30.0),
          Text(
            '¿Cual es tu correo?',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: colorPalette.secondaryDarkenColor,
            ),
          ),
          TextFormField(
            controller: emailTextEditingController,
            decoration: const InputDecoration(
              hintText: 'Ingresa tu correo',
            ),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: colorPalette.secondaryDarkenColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su correo';
              } else if (!value.contains('@') || !value.contains('.')) {
                return 'Por favor ingrese un correo válido';
              }
              return null;
            },
            onChanged: (value) {
              ref.read(userProvider.notifier).changeUser(email: value.trim());
              print(ref.read(userProvider));
            },
          ),
          const SizedBox(height: 20.0),
          Text(
            '¿Cual es tu numero de celular?',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: colorPalette.secondaryDarkenColor,
            ),
          ),
          TextFormField(
            controller: telefonoTextEditingController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Ingresa el número',
            ),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: colorPalette.secondaryDarkenColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su numero';
              }
              return null;
            },
            onChanged: (value) {
              if (value.isEmpty) return;
              ref
                  .read(userProvider.notifier)
                  .changeUser(telefono: int.parse(value.trim()));
            },
          ),
        ],
      ),
    );
  }
}
