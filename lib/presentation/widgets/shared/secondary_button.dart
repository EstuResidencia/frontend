import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondaryButton extends ConsumerWidget {
  final String? text;
  final IconData? icon;
  final Function()? onPressed;

  const SecondaryButton({
    this.text,
    this.icon,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: colorPalette.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          text ?? 'Button 2',
          style: TextStyle(
            color: colorPalette.backgroundColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
