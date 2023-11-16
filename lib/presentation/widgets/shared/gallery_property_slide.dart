import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:estu_residencia_app/domain/entities/post.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var review = [
  {1: 'Popular'},
  {2: 'Santa Cruz'},
  {3: 'Manrique'}
];

List<String> titulosGaleria = [
  'Baño',
  'Entrada',
  'Habitación',
  'Fachada',
  'Cocina',
  'Otro'
];

class GallerySlideshow extends StatelessWidget {
  final List<PostImage> images;
  const GallerySlideshow({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: images.length,
        itemBuilder: (context, index) => _Slide(
            dataImage: images[index].data, titulo: titulosGaleria[index < 5 ? index : 5]),
      ),
    );
  }
}

class _Slide extends ConsumerWidget {
  final String dataImage;
  final String titulo;
  const _Slide({required this.dataImage, required this.titulo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Card(
          color: colorPalette.primaryColor,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [

 Column(
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorPalette.secondaryColor),
                  ),
                ],
              ),
          
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(
                      base64Decode(
                        dataImage,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
