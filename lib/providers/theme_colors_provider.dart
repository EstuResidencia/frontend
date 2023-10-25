import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

const Map<String, Color> colors = {
  "primaryColor": Color(0xFF9BBFE1),
  "primaryDarkenColor": Color(0xFF5E82C8),
  "secondaryColor": Color(0xFF2C3D69),
  "backgroundColor": Color(0xFFF5F8FB),
  "secondaryDarkenColor": Color(0xFF1F2639),
  "error": Color(0xFFC43622),
  "pending": Color(0xFFE87D00),
  "ok": Color(0xFF138F17),
  "normal": Color(0xFF19569F),
};

class ColorPalette {
  final Color primaryColor;
  final Color primaryDarkenColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color secondaryDarkenColor;
  final Color error;
  final Color pending;
  final Color ok;
  final Color normal;

  const ColorPalette({
    required this.primaryColor,
    required this.primaryDarkenColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.secondaryDarkenColor,
    required this.error,
    required this.pending,
    required this.ok,
    required this.normal,
  });

  factory ColorPalette.fromJson(Map<String, Color> json) {
    return ColorPalette(
      primaryColor: json['primaryColor']!,
      primaryDarkenColor: json['primaryDarkenColor']!,
      secondaryColor: json['secondaryColor']!,
      backgroundColor: json['backgroundColor']!,
      secondaryDarkenColor: json['secondaryDarkenColor']!,
      error: json['error']!,
      pending: json['pending']!,
      ok: json['ok']!,
      normal: json['normal']!,
    );
  }
}

final colorsProvider =
    Provider<ColorPalette>((ref) => ColorPalette.fromJson(colors));
