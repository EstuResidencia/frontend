import 'package:estu_residencia_app/domain/entities/post.dart';
import 'package:estu_residencia_app/infrastructure/datasources/backend_user_datasourcer.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/card_post.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/windows/filter_window.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/windows/sort_window.dart';
import 'package:estu_residencia_app/providers/publish_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPlaceView extends ConsumerWidget {
  const SearchPlaceView({super.key});

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
                onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => const Dialog(
              child: SizedBox(
                height: 550,
                child: FilterWindow()),
            ),
          ),
                icon: Icon(
                  Icons.filter_list_alt,
                  color: colorPalette.secondaryColor,
                ),
                label: Text(
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: colorPalette.secondaryColor,
                  ),
                  'Filtrar',
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => const Dialog(
              child: SizedBox(
                height: 400,
                child: SortWindow(),
              ),
            ),
          ),
                icon: Icon(
                  Icons.sort_outlined,
                  color: colorPalette.secondaryColor,
                ),
                label: Text(
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: colorPalette.secondaryColor,
                  ),
                  'Ordenar',
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(
            child: FutureBuilder<List<Post>>(
              future: BackendUserDataSource().getAllPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else {
                  Future(() {
                    ref.read(postListProvider.notifier).state = snapshot.data!;
                  });
                  return snapshot.data!.isEmpty
                      ? const Center(
                          child: Text('No hay publicaciones'),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(2, 5, 2, 15),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CardPost(
                              isRequest: false,
                              elevation: index.toDouble(),
                              label: snapshot.data![index].postId.toString(),
                              values: snapshot.data![index],
                              colorPalette: colorPalette,
                            );
                          },
                        );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
