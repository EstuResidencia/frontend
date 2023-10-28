import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormKey = GlobalKey<FormState>();

final loginKeyProvider = StateProvider((ref) => loginFormKey);
final passwordVisibleProvider = StateProvider((ref) => false);
