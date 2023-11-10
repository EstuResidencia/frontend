import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsView extends ConsumerWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    return Column(
      children: [
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Directionality(
            textDirection: TextDirection.rtl,
              child: TextButton.icon(
              onPressed: () {},
              icon:  Icon(Icons.filter_list_alt, color: colorPalette.secondaryColor),
              label:  Text(
                style:TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold, color: colorPalette.secondaryColor),
                'Filtrar'),
                      ),
            ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
              onPressed: () {},
              icon:  Icon(Icons.sort_outlined,color: colorPalette.secondaryColor),
              label: Text(
                                style:TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold, color: colorPalette.secondaryColor),
                'Ordenar'),
            ),
          ),
        ],),
        const Expanded(child: Placeholder(),)
      ],
    );
  }
}
