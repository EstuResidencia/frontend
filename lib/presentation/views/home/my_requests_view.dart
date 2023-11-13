import 'package:estu_residencia_app/domain/entities/request.dart';
import 'package:estu_residencia_app/domain/entities/user.dart';
import 'package:estu_residencia_app/infrastructure/datasources/backend_user_datasourcer.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/card_post.dart';
import 'package:estu_residencia_app/providers/global_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyRequestsView extends ConsumerWidget {
  const MyRequestsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final User? user = ref.watch(loggedUserProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {},
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
                onPressed: () {},
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
            child: FutureBuilder<List<Request>>(
              future: BackendUserDataSource().getRequests(
                user!.userId,
                user.role!,
              ),
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
                  return snapshot.data!.isEmpty
                      ? const Center(
                          child: Text('No hay solicitudes'),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(2, 5, 2, 15),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CardPost(
                              isRequest: true,
                              elevation: index.toDouble(),
                              label: snapshot.data![index].postId.toString(),
                              values: snapshot.data![index].post!,
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
