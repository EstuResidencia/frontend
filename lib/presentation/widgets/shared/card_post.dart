import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  final String label;
  final double elevation;
  final Map values;
  final ColorPalette colorPalette;

  const CardPost({
    super.key,
    required this.label,
    required this.elevation,
    required this.values,
    required this.colorPalette,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 200,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: elevation,
        child: Row(
          children: [
            Image.network(
              'https://picsum.photos/id/${elevation.toInt()}/600/350',
              height: 200,
              width: 140,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Publicación $elevation",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${values['status']}',
                            style: const TextStyle(
                                fontSize: 11, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: colorPalette.secondaryColor),
                        Text(
                          values["direccion"],
                          style: TextStyle(
                              fontSize: 16, color: colorPalette.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.attach_money_outlined,
                            color: colorPalette.secondaryColor),
                        Text(
                          "${values['canon_cop']} COP/mes",
                          style: TextStyle(
                            fontSize: 16,
                            color: colorPalette.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$elevation hab",
                          style: TextStyle(
                              fontSize: 16, color: colorPalette.secondaryColor),
                        ),
                        Text(
                          "${values["area_m2"]} m2",
                          style: TextStyle(
                              fontSize: 16, color: colorPalette.secondaryColor),
                        ),
                        Text(
                          "Piso ${values["piso"]}",
                          style: TextStyle(
                              fontSize: 16, color: colorPalette.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Solicitudes $elevation",
                        style: TextStyle(
                            fontSize: 16, color: colorPalette.secondaryColor),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: IconButton.filled(
                              color: const Color(0xFF1F2639),
                              iconSize: 25,
                              onPressed: () {},
                              icon: const Icon(
                                  color: Colors.white, Icons.arrow_forward))),
                    ],
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
