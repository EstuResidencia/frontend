import 'package:estu_residencia_app/presentation/widgets/shared/tertiary_button.dart';
import 'package:estu_residencia_app/providers/register_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Step2TermsView extends ConsumerWidget {
  const Step2TermsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final acceptedTerms = ref.watch(acceptedTermsProvider);
    const termsText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut est arcu, laoreet vitae est nec, bibendum suscipit leo. Curabitur suscipit pretium justo sit amet convallis. Mauris id lacinia nunc. Phasellus at nisi sed augue rhoncus tristique vitae nec ex. Nulla facilisi. Sed auctor felis porttitor nisi rutrum, nec tincidunt orci commodo. Curabitur sit amet risus libero. Vestibulum rutrum pretium sapien, sed porttitor sem euismod et. In hac habitasse platea dictumst. Fusce ligula risus, malesuada et facilisis eu, suscipit sed nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam pretium dolor vel placerat vulputate. Integer iaculis at ante a aliquet. Donec ac lorem vel ex blandit tincidunt ut ut enim. Aenean posuere dapibus vulputate. Vivamus nisi ex, rutrum eget nibh porta, ultrices tempus nisi. Sed commodo, nisl ac blandit congue, quam justo aliquam augue, eget ullamcorper diam diam vel libero. Fusce commodo ut nunc eget tincidunt. Pellentesque cursus suscipit mauris, nec mattis sapien pretium nec. Integer lobortis nisl in velit mollis, pulvinar dignissim tortor rhoncus. In eu leo vitae elit sagittis rutrum ac non libero. Pellentesque vitae ante ex. Aliquam a urna tincidunt, placerat ipsum a, feugiat enim. Donec convallis dignissim odio, sit amet vulputate nunc faucibus eu. Praesent pharetra est eu augue iaculis volutpat. Sed feugiat, massa ut dapibus ornare, eros sapien lacinia justo, sit amet interdum nisl turpis id sem. Mauris efficitur viverra mauris sed pulvinar. Vestibulum sed metus ipsum. Nunc sit amet orci vitae tellus venenatis posuere. Maecenas tellus ex, venenatis sed ullamcorper in, imperdiet in ligula. Curabitur pretium fermentum quam, id egestas sapien consectetur a. Nulla in augue dui. Vivamus scelerisque ultricies dolor, non dapibus urna congue a. Ut laoreet consequat est, non euismod risus faucibus eu. Etiam vehicula sagittis dui vitae laoreet. Duis luctus sem lobortis enim cursus tincidunt. Aliquam pellentesque felis quis magna pulvinar vestibulum. Donec venenatis arcu rutrum viverra placerat. Aenean consequat nunc ac nisl vestibulum tempor. Vestibulum feugiat, dolor a ultricies imperdiet, nulla arcu dignissim ligula, eget scelerisque neque orci vitae erat. Ut tincidunt nisl nisl, vitae posuere ante mattis eu. Quisque gravida, nisi sit amet mollis varius, lectus ipsum finibus diam, ut convallis augue nunc nec lectus. Donec tincidunt velit at finibus vehicula. Mauris ullamcorper odio quis massa sodales maximus. Aenean sodales, massa ac consectetur interdum, quam ex eleifend eros, vitae porta enim metus in nibh. Proin quis ipsum egestas, gravida nisi eget, accumsan mauris. Cras sollicitudin justo vel metus porttitor, non pellentesque nunc consectetur. Sed vitae tellus nulla. Sed tincidunt id nulla vitae malesuada. Vestibulum semper risus sed ipsum hendrerit, at rhoncus est imperdiet. Etiam nec efficitur nunc. Pellentesque sagittis, risus quis cursus imperdiet, tortor massa consequat nunc, in imperdiet elit urna at urna. Donec sit amet mollis est. Sed vitae nisi ac nunc feugiat sagittis pretium ac mauris.';

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Text(
          'Primero que todo, deseamos que conozcas los requisitos legales y que estás aceptando en ellos:',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
            color: colorPalette.secondaryDarkenColor,
          ),
        ),
        const SizedBox(height: 20.0),
        LegalCard(
          colorPalette: colorPalette,
          termsText: termsText,
          title: 'Términos y condiciones',
          description:
              'Aceptas que conoces tus derechos y responsabilidades, al igual que las nuestras.',
        ),
        const SizedBox(height: 10.0),
        LegalCard(
          colorPalette: colorPalette,
          termsText: termsText,
          title: 'Aviso de privacidad',
          description:
              'Declaras que estás de acuerdo con los usos y objetivos para los que serán utilizados tus datos personales y aceptas que sean compartidos con terceros.',
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Checkbox(
              value: acceptedTerms,
              onChanged: (bool? value) {
                if (value != null) {
                  ref.read(acceptedTermsProvider.notifier).state = value;
                } else {
                  ref.read(acceptedTermsProvider.notifier).state = false;
                }
              },
            ),
            Expanded(
              child: Text(
                'He leído y acecpto los documentos anteriores.',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: colorPalette.secondaryDarkenColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LegalCard extends StatelessWidget {
  final ColorPalette colorPalette;
  final String termsText;
  final String title;
  final String description;

  const LegalCard({
    super.key,
    required this.colorPalette,
    required this.termsText,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: colorPalette.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.description),
                  SizedBox(
                    width: 80.0,
                    height: 30,
                    child: FilledButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 12,
                          ),
                          actionsPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 12,
                          ),
                          titlePadding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 12,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: colorPalette.primaryDarkenColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.close,
                                  color: colorPalette.secondaryDarkenColor,
                                ),
                              ),
                            ],
                          ),
                          content: SingleChildScrollView(
                            child: Text(
                              style: TextStyle(
                                fontSize: 12.0,
                                color: colorPalette.secondaryDarkenColor,
                              ),
                              termsText,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: colorPalette.primaryDarkenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                      ),
                      child: Text(
                        'Ver más',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: colorPalette.backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  color: colorPalette.secondaryDarkenColor,
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                description,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  color: colorPalette.secondaryDarkenColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
