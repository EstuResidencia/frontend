import 'package:estu_residencia_app/presentation/widgets/shared/custom_bottom_nav_bar.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'general-home-screen';

  final Widget childView;

  const HomeScreen({
    super.key,
    required this.childView,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colorPalette.primaryColor,
        systemNavigationBarDividerColor: colorPalette.primaryColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('EstuResidencia'),
        ),
        body: childView,
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
