import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryButton extends ConsumerWidget {
  final String? text;
  final IconData? icon;
  final Function()? onPressed;

  const PrimaryButton({
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
          backgroundColor: colorPalette.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text ?? 'Button 1',
          style: TextStyle(color: colorPalette.secondaryColor),
        ),
      ),
    );
  }
}
