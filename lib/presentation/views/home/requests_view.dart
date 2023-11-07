import 'package:estu_residencia_app/presentation/widgets/shared/card_post.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 1, 'label': 'Elevation 1', 'direccion': 'carrera 50 # 40-29', 'canon_cop': '850.000','area_m2': "10","piso":1,"comuna":3, 'status':"cancelada"},
  {'elevation': 2, 'label': 'Elevation 2', 'direccion': 'carrera 50 # 40-29', 'canon_cop': '850.000','area_m2': "10","piso":1,"comuna":3, 'status':"cancelada"},
  {'elevation': 0, 'label': 'Elevation 0', 'direccion': 'carrera 50 # 40-29', 'canon_cop': '850.000','area_m2': "10","piso":1,"comuna":3, 'status':"cancelada"},
  {'elevation': 3, 'label': 'Elevation 3', 'direccion': 'carrera 50 # 40-29', 'canon_cop': '850.000','area_m2': "10","piso":1,"comuna":3, 'status':"aprobada"},
  {'elevation': 4, 'label': 'Elevation 4', 'direccion': 'carrera 50 # 40-29', 'canon_cop': '850.000','area_m2': "10","piso":1,"comuna":3, 'status':"cancelada"},
  {'elevation': 5, 'label': 'Elevation 5', 'direccion': 'carrera 50 # 40-29', 'canon_cop': '850.000','area_m2': "10","piso":1,"comuna":3, 'status':"pendiente"},
  {'elevation': 5, 'label': 'Elevation 10', 'direccion': 'carrera 50 # 40-29', 'canon_cop': '850.000','area_m2': "10","piso":1,"comuna":3, 'status':"cancelada"},
  {'elevation': 5, 'label': 'Elevation 5', 'direccion': 'carrera 50 # 40-29', 'canon_cop': '850.000','area_m2': "10","piso":1,"comuna":3, 'status':"cancelada"},

];

class RequestsView extends ConsumerWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    return SizedBox(
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(2,5,2, 15),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return CardPost( elevation: index.toDouble() , label: cards[index]["label"], values: cards[index], colorPalette: colorPalette);
          
        }
      )
    );
   
  }
}


