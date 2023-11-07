import 'package:flutter/material.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_alt),
            label: const Text('Filtrar'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sort_outlined),
            label: const Text('Ordenar'),
          ),
        ],),
        const Expanded(child: Placeholder(),)
      ],
    );
  }
}
