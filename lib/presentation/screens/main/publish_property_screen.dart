// ignore_for_file: use_build_context_synchronously
import 'package:estu_residencia_app/domain/entities/post.dart';
import 'package:estu_residencia_app/domain/entities/user.dart';
import 'package:estu_residencia_app/infrastructure/datasources/backend_user_datasourcer.dart';
import 'package:estu_residencia_app/presentation/widgets/shared/alerts.dart';
import 'package:estu_residencia_app/providers/global_provider.dart';
import 'package:estu_residencia_app/providers/publish_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:estu_residencia_app/providers/theme_colors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

final postPublishKeyProvider = StateProvider((ref) => GlobalKey<FormState>());
final descriptionCotrollerProvider =
    StateProvider((ref) => TextEditingController());
final direccionCotrollerProvider =
    StateProvider((ref) => TextEditingController());
final comunaDropdownValueProvider = StateProvider<String?>((ref) => null);
final canonCopCotrollerProvider =
    StateProvider((ref) => TextEditingController());
final areaM2CotrollerProvider = StateProvider((ref) => TextEditingController());
final pisoCotrollerProvider = StateProvider((ref) => TextEditingController());

class PublishPropertyScreen extends ConsumerWidget {
  static const name = 'publish-property-screen';

  final int stepIndex;

  const PublishPropertyScreen({
    super.key,
    required this.stepIndex,
  });

  final stepTitles = const <String>[
    'Publicar inmueble',
    'Adjuntar evidencias',
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (stepIndex > 0) {
                    context.go('/publish/${stepIndex - 1}');
                  } else {
                    context.go('/');
                  }
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Text(
                stepTitles[stepIndex],
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: colorPalette.secondaryDarkenColor,
                ),
              ),
            ],
          ),
          backgroundColor: colorPalette.primaryColor,
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
          child: IndexedStack(
            index: stepIndex,
            children: const [
              _Step1Publish(),
              _Step2Publish(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Step1Publish extends ConsumerWidget {
  const _Step1Publish();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final User? user = ref.watch(loggedUserProvider);
    final GlobalKey<FormState> postPublishKey =
        ref.watch(postPublishKeyProvider);
    final String? comunaDropdownValue = ref.watch(comunaDropdownValueProvider);
    final TextEditingController direccionController =
        ref.watch(direccionCotrollerProvider);
    final TextEditingController canonCopController =
        ref.watch(canonCopCotrollerProvider);
    final TextEditingController areaM2Controller =
        ref.watch(areaM2CotrollerProvider);
    final TextEditingController pisoController =
        ref.watch(pisoCotrollerProvider);
    final TextEditingController descripcionController =
        ref.watch(descriptionCotrollerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Form(
            key: postPublishKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Necesitamos los siguientes datos de tu inmueble:',
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    hintText: 'Elige la región',
                  ),
                  value: comunaDropdownValue,
                  items: comunaDropdownItems,
                  onChanged: (value) {
                    ref.read(postPublishProvider.notifier).changePost(
                          comuna: int.parse(value!),
                        );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor seleccione uan región';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: direccionController,
                  decoration: const InputDecoration(
                    hintText: 'Ingresa la dirección',
                  ),
                  onChanged: (value) {
                    ref.read(postPublishProvider.notifier).changePost(
                          direccion: value,
                        );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la dirección';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: areaM2Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Area en m2',
                        ),
                        onChanged: (value) {
                          ref.read(postPublishProvider.notifier).changePost(
                                areaM2: int.parse(value),
                              );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un valor';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: pisoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Piso',
                        ),
                        onChanged: (value) {
                          ref.read(postPublishProvider.notifier).changePost(
                                floor: int.parse(value),
                              );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un valor';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: canonCopController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Ingresa el valor del canon de arrendamiento',
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: colorPalette.secondaryDarkenColor,
                    ),
                  ),
                  onChanged: (value) {
                    ref.read(postPublishProvider.notifier).changePost(
                          canonCop: int.parse(value),
                        );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un valor';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descripcionController,
                  decoration: const InputDecoration(
                    hintText: 'Descripción breve del inmuble',
                  ),
                  onChanged: (value) {
                    ref.read(postPublishProvider.notifier).changePost(
                          description: value,
                        );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la descripción';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                if (postPublishKey.currentState!.validate()) {
                  ref.read(postPublishProvider.notifier).changePost(
                        userId: user!.userId,
                      );
                  context.go('/publish/1');
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: colorPalette.primaryDarkenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 8,
                ),
              ),
              child: Icon(
                Icons.arrow_forward,
                color: colorPalette.backgroundColor,
                size: 42,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _Step2Publish extends ConsumerWidget {
  const _Step2Publish();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPalette colorPalette = ref.watch(colorsProvider);
    final PostPublish postPublish = ref.watch(postPublishProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Tomar fotos',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: colorPalette.secondaryDarkenColor,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      File? _imageFile;

                      final picker = ImagePicker();
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.camera);

                      if (pickedFile != null) {
                        showLoaderDialog(context);
                        _imageFile = File(pickedFile.path);
                        final Uint8List bytes = await _imageFile
                            .readAsBytes(); // you can also use the readAsBytes method.
                        final image = img.decodeImage(bytes);
                        final compressedImage =
                            img.encodeJpg(image!, quality: 85);
                        final imageString =
                            base64Encode(Uint8List.fromList(compressedImage));
                        ref
                            .read(postPublishProvider.notifier)
                            .addImage(imageString);
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                  Expanded(
                    child: postPublish.images != null &&
                            postPublish.images!.isNotEmpty
                        ? Container(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: postPublish.images!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 8.0,
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: MemoryImage(
                                              base64Decode(
                                                postPublish.images![index].data,
                                              ),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: -20,
                                        right: -30,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            ref
                                                .read(postPublishProvider
                                                    .notifier)
                                                .removeImage(index);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 15, 20, 2),
                                            backgroundColor: colorPalette
                                                .backgroundColor, // <-- Button color
                                            foregroundColor:
                                                Colors.grey, // <-- Splash color
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: colorPalette.secondaryDarkenColor,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'No hay fotos',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: colorPalette.secondaryDarkenColor,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Debes adjuntar evidencia de:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: colorPalette.secondaryDarkenColor,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '- Baño\n- Entrada\n- Habitación\n- Fachada\n- Cocina',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: colorPalette.secondaryDarkenColor,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Esto lo hacemos con el objetivo de validar, verificar y darle más seguridad a los posibles arrendatarios del inmueble',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: colorPalette.secondaryDarkenColor,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      '¡Nos encargaremos de que la validación se haga en el menor tiempo posible!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: colorPalette.secondaryDarkenColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // ACTIONS
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () async {
                if (postPublish.images == null || postPublish.images!.isEmpty) {
                  showErrorDialog(
                      context, 'Debes adjuntar al menos una foto del inmueble');
                  return;
                }
                showLoaderDialog(context);
                try {
                  await BackendUserDataSource().createPost(
                    userId: postPublish.userId!,
                    description: postPublish.description!,
                    direccion: postPublish.direccion!,
                    comuna: postPublish.comuna!,
                    canonCop: postPublish.canonCop!,
                    areaM2: postPublish.areaM2!,
                    floor: postPublish.floor!,
                    images: postPublish.images!,
                  );
                  Navigator.of(context, rootNavigator: true).pop();
                  ref.read(postPublishProvider.notifier).restorePost();
                  ref.read(comunaDropdownValueProvider.notifier).state = null;
                  ref.read(direccionCotrollerProvider).clear();
                  ref.read(canonCopCotrollerProvider).clear();
                  ref.read(areaM2CotrollerProvider).clear();
                  ref.read(pisoCotrollerProvider).clear();
                  ref.read(descriptionCotrollerProvider).clear();
                  showSuccessDialog(
                    context,
                    'Publicación creada con éxito',
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      context.go('/');
                    },
                  );
                } on PlatformException catch (e) {
                  Navigator.of(context, rootNavigator: true).pop();
                  late String message;
                  if (e.code == '400') {
                    message = 'Revisa los datos ingresados';
                  } else {
                    message =
                        'Ocurrió un error inesperado, estamos trabajando en ello';
                  }
                  showErrorDialog(context, message);
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: colorPalette.primaryDarkenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              child: Text(
                'Publicar',
                style: TextStyle(
                  color: colorPalette.backgroundColor,
                  fontSize: 18.0,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

List<DropdownMenuItem<String>> get comunaDropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "1",
      child: Text("POPULAR"),
    ),
    const DropdownMenuItem(
      value: "2",
      child: Text("SANTA CRUZ"),
    ),
    const DropdownMenuItem(
      value: "3",
      child: Text("MANRIQUE"),
    ),
    const DropdownMenuItem(
      value: "4",
      child: Text("ARANJUEZ"),
    ),
    const DropdownMenuItem(
      value: "5",
      child: Text("CASTILLA"),
    ),
    const DropdownMenuItem(
      value: "6",
      child: Text("DOCE DE OCTUBRE"),
    ),
    const DropdownMenuItem(
      value: "7",
      child: Text("ROBLEDO"),
    ),
    const DropdownMenuItem(
      value: "8",
      child: Text("VILLA HERMOSA"),
    ),
    const DropdownMenuItem(
      value: "9",
      child: Text("BUENOS AIRES"),
    ),
    const DropdownMenuItem(
      value: "10",
      child: Text("LA CANDELARIA"),
    ),
    const DropdownMenuItem(
      value: "11",
      child: Text("LAURELES ESTADIO"),
    ),
    const DropdownMenuItem(
      value: "12",
      child: Text("LA AMERICA"),
    ),
    const DropdownMenuItem(
      value: "13",
      child: Text("SAN JAVIER"),
    ),
    const DropdownMenuItem(
      value: "14",
      child: Text("EL POBLADO"),
    ),
    const DropdownMenuItem(
      value: "15",
      child: Text("GUAYABAL"),
    ),
    const DropdownMenuItem(
      value: "16",
      child: Text("BELEN"),
    ),
  ];
  return menuItems;
}
