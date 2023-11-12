import 'package:card_swiper/card_swiper.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var review = [
  {1: 'Popular'},
  {2: 'Santa Cruz'},
  {3: 'Manrique'}
];

class ReviewsSlideshow extends StatelessWidget {
  const ReviewsSlideshow({super.key, required});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: review.length,
        itemBuilder: (context, index) => _Slide(review: review[index]),
      ),
    );
  }
}

class _Slide extends ConsumerWidget {
  final Map review;
  const _Slide({required this.review});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Card(
          color: colorPalette.primaryColor,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 50, 0, 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://t4.ftcdn.net/jpg/03/49/49/79/360_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.webp'),
                radius: 40,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Cassandra Gómez",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorPalette.secondaryColor),
                  ),
                  const Expanded(child: Placeholder())
                ],
              ),
            ),
          ])),
    );
  }
}
