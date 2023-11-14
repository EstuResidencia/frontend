// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:estu_residencia_app/domain/entities/post.dart';
import 'package:estu_residencia_app/domain/entities/user.dart';
import 'package:estu_residencia_app/infrastructure/datasources/backend_user_datasourcer.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/alerts.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/gallery_property_slide.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/review_slide.dart';
import 'package:estu_residencia_app/providers/global_provider.dart';
import 'package:estu_residencia_app/providers/publish_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

List<Map<String, dynamic>> estados = [
  {'estado': 'Pendiente', 'color': const Color(0xFFE87D00)},
  {'estado': 'Aprobada', 'color': const Color(0xFF138F17)},
  {'estado': 'Cancelada', 'color': const Color(0xFF19569F)},
  {'estado': 'Rechazada', 'color': const Color.fromARGB(255, 232, 5, 5)}
];

var comunas = {
  1: 'Popular',
  2: 'Santa Cruz',
  3: 'Manrique',
  4: 'Aranjuez',
  5: 'Castilla',
  6: 'Doce de octubre',
  7: 'Robledo',
  8: 'Villa hermosa',
  9: 'Buenos Aires',
  10: 'La Candelaria',
  11: "Laureles Estadio",
  12: 'La América',
  13: 'San Javier',
  14: 'El Poblado',
  15: 'Guayabal',
  16: 'Belén'
};
class PropertyDetailScreen extends ConsumerWidget {
  static const name = 'property-detail-screen';

  final int postId;

  const PropertyDetailScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final User? user = ref.watch(loggedUserProvider);
    final Post? post = ref
        .watch(postListProvider)!
        .where((element) => element.postId == postId)
        .firstOrNull;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colorPalette.backgroundColor,
        systemNavigationBarDividerColor: colorPalette.backgroundColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                  )
                ],
              ),
              if (user!.role == 1)
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
        body: Stack(
          children: [
            SingleChildScrollView(
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
                              "${post.direccion} , ${comunas[post.comuna]}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: colorPalette.secondaryColor),
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
                              "${formatearNumeroConPuntos(post.canonCop)} COP/mes",
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
                                  fontSize: 16,
                                  color: colorPalette.secondaryColor),
                            ),
                            Text(
                              "Piso ${post.floor}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: colorPalette.secondaryColor),
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
                                  fontSize: 18,
                                  color: colorPalette.secondaryColor),
                            ),
                            RatingBarIndicator(
                              unratedColor: Colors.black26,
                              rating: (post.calificacion/2).toDouble(),
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
                              color:
                                  estados[post.status - 1]['color'] as Color),
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
                        "Galería",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: colorPalette.secondaryColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GallerySlideshow(images: post.images ),
                      //const ReviewsSlideshow(),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              child: user.role == 2
                  ? FilledButton(
                      onPressed: () async {
                        showLoaderDialog(context);
                        try {
                          await BackendUserDataSource().createRequest(
                            user.userId,
                            post.postId,
                          );
                          Navigator.of(context, rootNavigator: true).pop();
                          showSuccessDialog(
                            context,
                            'Solicitud enviada',
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              context.go('/');
                            },
                          );
                        } on PlatformException catch (e) {
                          Navigator.of(context, rootNavigator: true).pop();
                          late String message;
                          if (e.code == '400') {
                            message = 'Revisa los datos ingresados';
                          } else {
                            message =
                                'Ocurrió un error inesperado, estamos trabajando en ello';
                          }
                          showErrorDialog(context, message);
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: colorPalette.primaryDarkenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      child: Text(
                        'Solicitar',
                        style: TextStyle(
                          color: colorPalette.backgroundColor,
                          fontSize: 18.0,
                        ),
                      ),
                    )
                  : const SizedBox(height: 0),
            ),
          ],
        ),
      ),
    );
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

// Formatea el número con puntos en los miles
String formatearNumeroConPuntos(int numero) {
    
    return numero.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]}.',
    );
  }