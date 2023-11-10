import 'package:estu_residencia_app/domain/entities/user.dart';
import 'package:estu_residencia_app/providers/global_provider.dart';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(loggedUserProvider);
    final ColorPalette colorPalette = ref.watch(colorsProvider);

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 40, 40, 20),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://t4.ftcdn.net/jpg/03/49/49/79/360_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.webp'),
                  radius: 100,
                ),
              ),
              Text('${user?.name}', textScaleFactor: 2),
              const SizedBox(height: 10),
              Text('${user?.email}', textScaleFactor: 1.4),
              const SizedBox(height: 40),
              TextButton.icon(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        actionsPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        actionsAlignment: MainAxisAlignment.center,
                          title: Text(
                            'Atención al cliente',
                            style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                                color: colorPalette.primaryDarkenColor),
                          ),
                          insetPadding: const EdgeInsets.symmetric(vertical: 250),
                          content: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.local_phone,
                                      color: colorPalette.primaryDarkenColor,
                                    ),
                                    const Text(
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ' Whatsapp: +57 310 41001921')
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
                                      color: colorPalette.primaryDarkenColor,
                                    ),
                                    const Text(
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                        ' Correo: Yaper@unal.edu.co')
                                  ],
                                ),
                              )
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => context.pop(),
                                child: const Text('Ok')),
                          ],
                        )),
                icon: const Icon(Icons.announcement_rounded),
                label: const Text('Reportar inconvenientes'),
              ),
              TextButton.icon(
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
                          'Términos y condiciones',
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
                        "Cupidatat minim cillum veniam commodo. Laboris ex eiusmod culpa culpa consectetur non cillum et ea esse ullamco sint. Cillum id elit nisi ad nulla ad aliqua. Consectetur ut ipsum laboris id proident sunt ut veniam aliquip ea.\nQui ex sint est ut pariatur do in dolore magna occaecat. Reprehenderit amet tempor velit amet. In excepteur velit est Lorem aliquip dolor laboris adipisicing. Ex voluptate do dolore irure incididunt non reprehenderit.\nAliqua non adipisicing duis aute dolor culpa laborum do elit eu sunt deserunt ut. Eu occaecat ea exercitation cillum ea adipisicing minim sit officia aliqua. Consequat dolore id do Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.",
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
                icon: const Icon(Icons.assignment_outlined),
                label: const Text('Términos y condiciones'),
              ),
              TextButton.icon(
                onPressed: ()=> showDialog(
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
                          'Política de privacidad de datos',
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
                        "Cupidatat minim cillum veniam commodo. Laboris ex eiusmod culpa culpa consectetur non cillum et ea esse ullamco sint. Cillum id elit nisi ad nulla ad aliqua. Consectetur ut ipsum laboris id proident sunt ut veniam aliquip ea.\nQui ex sint est ut pariatur do in dolore magna occaecat. Reprehenderit amet tempor velit amet. In excepteur velit est Lorem aliquip dolor laboris adipisicing. Ex voluptate do dolore irure incididunt non reprehenderit.\nAliqua non adipisicing duis aute dolor culpa laborum do elit eu sunt deserunt ut. Eu occaecat ea exercitation cillum ea adipisicing minim sit officia aliqua. Consequat dolore id do Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.Lorem duis enim esse id adipisicing magna tempor ex.",
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
                icon: const Icon(Icons.policy_outlined),
                label: const Text('Política de privacidad de datos'),
              ),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        titlePadding: const EdgeInsets.all(0),
                        content: const Text(
                          '¿Está seguro que desea cerrar sesión?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        actionsPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          TextButton(
                            onPressed: () {
                              ref.read(selectedSectionProvider.notifier).state = 0;
                              context.go('/login');
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF5E82C8),
                            ),
                            child: const Text(
                              'Si',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF5E82C8),
                            ),
                            child: const Text(
                              'No',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
                label: const Text(
                  'Cerrar sesión',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
