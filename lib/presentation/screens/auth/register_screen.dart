import 'package:estu_residencia_app/presentation/views/views.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/primary_button.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerWidget {
  static const name = 'resgister-screen';

  final int stepIndex;

  const RegisterScreen({
    super.key,
    required this.stepIndex,
  });

  final viewRoutesSteps = const <Widget>[
    Step1NameView(),
    Step2TermsView(),
    Step3EmailView(),
    Step4PasswordView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colorPalette.backgroundColor,
        systemNavigationBarDividerColor: colorPalette.backgroundColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(),
          backgroundColor: colorPalette.backgroundColor,
          centerTitle: false,
        ),
        body: IndexedStack(
          index: stepIndex,
          children: viewRoutesSteps,
        ),
      ),
    );
  }
}
