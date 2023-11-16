import 'package:estu_residencia_app/providers/filter_provider.dart';
import 'package:estu_residencia_app/providers/sort_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final List<String> comunas = [ 'Popular',
 'Santa Cruz',
 'Manrique',
 'Aranjuez',
 'Castilla',
 'Doce de octubre',
 'Robledo',
 'Villa hermosa',
 'Buenos Aires',
   'La Candelaria',
   "Laureles Estadio",
   'La América',
   'San Javier',
   'El Poblado',
   'Guayabal',
   'Belén'];

class FilterWindow extends ConsumerWidget {
  const FilterWindow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final int maxprice = ref.watch(filterMaxPriceProvider);
    final int minprice = ref.watch(filterMinPriceProvider);

    final int areaMin = ref.watch(filterAreaMinProvider);
    final int filterComuna = ref.watch(filterComunaProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: colorPalette.secondaryColor),
            "Comuna:"),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               IconButton(
            icon: const Icon(Icons.navigate_before_rounded),
            onPressed: () {
               filterComuna <1? ref.read(filterComunaProvider.notifier).state = 15 : ref.read(filterComunaProvider.notifier).state--  ;
            },
          ),
              Text(
                
                style: TextStyle(
                  fontSize: 23,
                  color: colorPalette.secondaryColor),
                  comunas[filterComuna]),
              IconButton(
            icon: const Icon(Icons.navigate_next_rounded),
            onPressed: () {
               filterComuna >14? ref.read(filterComunaProvider.notifier).state = 0 : ref.read(filterComunaProvider.notifier).state++  ;
            },
          ),
            ],
          ),
        Text(
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colorPalette.secondaryColor),
            "Área mínima:"),

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
               areaMin <1? ref.read(filterAreaMinProvider.notifier).state = 0 : ref.read(filterAreaMinProvider.notifier).state--  ;
            },
          ),
              Text(
                
                style: TextStyle(
                  fontSize: 23,
                  color: colorPalette.secondaryColor),
                  "$areaMin m2"),
              IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
               ref.read(filterAreaMinProvider.notifier).state++  ;
            },
          ),
            ],
          ),
        Text(
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colorPalette.secondaryColor),
            "Rango de precios:"),

        RangeSlider(
  min: 0,
  max: 3000000,
  divisions: 20,
  labels: RangeLabels(
    formatearNumeroConPuntos(minprice.round()),
    formatearNumeroConPuntos(maxprice.round()),
  ),
  values: RangeValues(minprice.toDouble(), maxprice.toDouble()),
  onChanged: (values) {
      ref.read(filterMinPriceProvider.notifier).state = values.start.toInt();
      ref.read(filterMaxPriceProvider.notifier).state  = values.end.toInt();
    }),







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
    );
  }
}


// Formatea el número con puntos en los miles
String formatearNumeroConPuntos(int numero) {
    
    return numero.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]}.',
    );
  }