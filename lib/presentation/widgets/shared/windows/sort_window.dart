import 'package:estu_residencia_app/providers/filter_provider.dart';
import 'package:estu_residencia_app/providers/sort_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<String> atributos = ['Precio', 'Comuna', 'm2','Piso'];

class SortWindow extends ConsumerWidget {
  const SortWindow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool sortSwitch = ref.watch(sortProvider);
    final int sortCategory = ref.watch(sortCategoryProvider);
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 10, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: colorPalette.primaryDarkenColor,
                  ),
                  "Ascendente"),
              Switch(
              value: sortSwitch,
              activeColor: colorPalette.secondaryColor,
              onChanged: (bool cambio) {

                    ref.read(sortProvider.notifier).state = cambio;
              }),
              Text(
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: colorPalette.primaryDarkenColor),
                  "Descendente"),
            ],
          ),
          Text(
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorPalette.secondaryColor),
              "Selecciona el atributo por el cual deseas ordenar:"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               IconButton(
            icon: const Icon(Icons.navigate_before_rounded),
            onPressed: () {
               sortCategory <1? ref.read(sortCategoryProvider.notifier).state = 3 : ref.read(sortCategoryProvider.notifier).state--  ;
            },
          ),
              Text(
                
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: colorPalette.secondaryColor),
                  atributos[sortCategory]),
              IconButton(
            icon: const Icon(Icons.navigate_next_rounded),
            onPressed: () {
               sortCategory >2? ref.read(sortCategoryProvider.notifier).state = 0 : ref.read(sortCategoryProvider.notifier).state++  ;
            },
          ),
            ],
          ),

          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  ),
                  'Aceptar'),
          ),
        ],
      ),
    );
  }
}
