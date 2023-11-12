import 'package:estu_residencia_app/presentation/widgets/shared/review_slide.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PropertyDetailScreen extends ConsumerWidget {
  static const name = 'property-detail-screen';

  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.go('/requests');
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
                child: Image.network(
                  'https://picsum.photos/id/${1}/600/350',
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
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
                          "variable = direccion",
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
                          "Variable = canon_cop COP/mes",
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
                          "Variable = area_m2",
                          style: TextStyle(
                              fontSize: 16, color: colorPalette.secondaryColor),
                        ),
                        Text(
                          "Variable = piso ",
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
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      'Estado',
                      style: TextStyle(fontSize: 14, color: Colors.red),
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
                  const Placeholder(fallbackHeight: 200,),
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
