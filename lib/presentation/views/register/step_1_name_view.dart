import 'package:estu_residencia_app/providers/register_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1NameView extends ConsumerWidget {
  const Step1NameView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final GlobalKey<FormState> nameFormKey = ref.watch(nameFormKeyProvider);
    final TextEditingController nameTextEditingController =
        ref.watch(nameProviderController);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Text(
          'Queremos conocerte',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w900,
            color: colorPalette.secondaryDarkenColor,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          '¿Cómo te llamas?',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: colorPalette.secondaryDarkenColor,
          ),
        ),
        Form(
          key: nameFormKey,
          child: TextFormField(
            controller: nameTextEditingController,
            decoration: const InputDecoration(
              hintText: 'Ingresa tu nombre',
            ),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: colorPalette.secondaryDarkenColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa tu nombre';
              }
              return null;
            },
            onChanged: (value) {
              ref.read(userProvider.notifier).changeUser(name: value.trim());
              print(ref.read(userProvider));
            },
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          'Puedes escribir el nombre que te gustaría tener en la app',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.normal,
            color: colorPalette.secondaryDarkenColor,
          ),
        ),
      ],
    );
  }
}
