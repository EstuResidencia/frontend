import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormKey = GlobalKey<FormState>();
final emailTextEditingController = TextEditingController();
final passwordTextEditingController = TextEditingController();

final loginKeyProvider = StateProvider((ref) => loginFormKey);
final emailProvider = StateProvider((ref) => emailTextEditingController);
final passwordProvider = StateProvider((ref) => passwordTextEditingController);

final passwordVisibleProvider = StateProvider((ref) => false);
