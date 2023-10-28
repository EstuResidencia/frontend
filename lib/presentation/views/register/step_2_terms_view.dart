import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Step2TermsView extends ConsumerWidget {
  const Step2TermsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Text(
          'Primero que todo, deseamos que conozcas los requisitos legales y que estás aceptando en ellos:',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
            color: colorPalette.secondaryDarkenColor,
          ),
        ),
        const SizedBox(height: 20.0),
        Center(
          child: Card(
            elevation: 0,
            color: colorPalette.primaryDarkenColor,
            child: Column(
              children: [
                Row(
                  children: [Text("Hola")],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
