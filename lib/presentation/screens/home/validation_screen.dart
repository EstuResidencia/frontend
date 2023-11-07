import 'package:estu_residencia_app/presentation/widgets/shared/primary_button.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/tertiary_button.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final validateFormKey = GlobalKey<FormState>();
final validateKeyProvider = StateProvider((ref) => validateFormKey);
final docNumberTextEditingController = TextEditingController();
final docNumberCotrollerProvider =
    StateProvider((ref) => docNumberTextEditingController);
final dropdownValueProvider = StateProvider<String?>((ref) => null);

class ValidationScreen extends ConsumerWidget {
  static const name = 'validation-screen';

  final int role;

  const ValidationScreen({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final GlobalKey<FormState> validateFormKey = ref.watch(validateKeyProvider);
    final TextEditingController docNumberTextEditingController =
        ref.watch(docNumberCotrollerProvider);
    final String? dropdownValue = ref.watch(dropdownValueProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colorPalette.backgroundColor,
        systemNavigationBarDividerColor: colorPalette.backgroundColor,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: colorPalette.backgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => context.go('/'),
                icon: Icon(
                  Icons.close,
                  color: colorPalette.secondaryDarkenColor,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Text(
                  'Para validar tu cuenta necesaitamos los siguientes datos:'),
              const SizedBox(height: 40),
              Form(
                key: validateFormKey,
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: 'Tipo de documento',
                      ),
                      value: dropdownValue,
                      items: dropdownItems,
                      onChanged: (value) {
                        ref.read(dropdownValueProvider.notifier).state =
                            value.toString();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor seleccione un tipo de documento';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: docNumberTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Ingresa tu documento de identidad',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su documento de identidad';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              TertiaryButton(
                text: 'Enviar',
                onPressed: () {
                  if (validateFormKey.currentState!.validate()) {
                    print(dropdownValue);
                    print(docNumberTextEditingController.text);
                    print(role);
                    print('validado ${true}');
                    ref.read(dropdownValueProvider.notifier).state = null;
                    docNumberTextEditingController.clear();
                    //TODO hacer patch a user
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "CC",
      child: Text("Cédula de ciudadania"),
    ),
    const DropdownMenuItem(
      value: "CE",
      child: Text("Cédula de extranjeria"),
    ),
    const DropdownMenuItem(
      value: "TI",
      child: Text("Tarjeta de identidad"),
    ),
    const DropdownMenuItem(
      value: "PP",
      child: Text("Permiso por protección"),
    ),
  ];
  return menuItems;
}
