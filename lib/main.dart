import 'package:estu_residencia_app/config/theme/app_theme.dart';
import 'package:estu_residencia_app/presentation/screens/home/home_screen.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(colorPalette: colorPalette).theme(),
      home: HomeScreen(),
    );
  }
}
