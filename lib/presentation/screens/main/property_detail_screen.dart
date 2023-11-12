import 'dart:convert';

import 'package:estu_residencia_app/domain/entities/post.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/review_slide.dart';
import 'package:estu_residencia_app/providers/publish_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

List<Map<String, dynamic>> estados = [
  {'estado': 'Pendiente', 'color': const Color(0xFFE87D00)},
  {'estado': 'Aprobada', 'color': const Color(0xFF138F17)},
  {'estado': 'Cancelada', 'color': const Color(0xFF19569F)},
  {'estado': 'Rechazada', 'color': const Color.fromARGB(255, 232, 5, 5)}
];

class PropertyDetailScreen extends ConsumerWidget {
  static const name = 'property-detail-screen';

  final int postId;

  const PropertyDetailScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final Post? post = ref
        .watch(postListProvider)!
        .where((element) => element.postId == postId)
        .firstOrNull;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.go('/posts');
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Text(
                "Publicación",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: colorPalette.secondaryDarkenColor,
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_outline_outlined)),
                ],
              )
            ],
          ),
          backgroundColor: colorPalette.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(
                        base64Decode(
                          post!.images[0].data,
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: colorPalette.secondaryColor),
                        Text(
                          post.direccion,
                          style: TextStyle(
                              fontSize: 16, color: colorPalette.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  const _DividerAtributes(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
                    child: Row(
                      children: [
                        Icon(Icons.attach_money_outlined,
                            color: colorPalette.secondaryColor),
                        Text(
                          "${post.canonCop} COP/mes",
                          style: TextStyle(
                            fontSize: 20,
                            color: colorPalette.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const _DividerAtributes(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${post.areaM2} m2",
                          style: TextStyle(
                              fontSize: 16, color: colorPalette.secondaryColor),
                        ),
                        Text(
                          "Piso ${post.floor}",
                          style: TextStyle(
                              fontSize: 16, color: colorPalette.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  const _DividerAtributes(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Calificación",
                          style: TextStyle(
                              fontSize: 18, color: colorPalette.secondaryColor),
                        ),
                        RatingBarIndicator(
                          unratedColor: Colors.black26,
                          rating: 3,
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: colorPalette.primaryDarkenColor,
                          ),
                          itemCount: 5,
                          itemSize: 40.0,
                        ),
                      ],
                    ),
                  ),
                  const _DividerAtributes(),
                  const SizedBox(height: 10),
                  Container(
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: estados[post.status - 1]['color'] as Color,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '${estados[post.status - 1]['estado']}',
                      style: TextStyle(
                          fontSize: 14,
                          color: estados[post.status - 1]['color'] as Color),
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                    color: colorPalette.secondaryColor,
                  ),
                  Text(
                    "Descripción",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: colorPalette.secondaryColor),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text(post.description),
                  ),
                  Divider(
                    height: 30,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                    color: colorPalette.secondaryColor,
                  ),
                  Text(
                    "Reseñas",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: colorPalette.secondaryColor),
                  ),
                  const ReviewsSlideshow(),
                  const SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class _DividerAtributes extends StatelessWidget {
  const _DividerAtributes();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 15,
      thickness: 1,
      indent: 25,
      endIndent: 25,
      color: Colors.black26,
    );
  }
}
