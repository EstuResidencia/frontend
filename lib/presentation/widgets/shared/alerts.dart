import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    titlePadding: EdgeInsets.zero,
    actionsPadding: EdgeInsets.zero,
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Container(
          margin: const EdgeInsets.only(left: 7),
          child: const Text("Cargando..."),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showErrorDialog(BuildContext context, String? message) {
  AlertDialog alert = AlertDialog(
    content: Expanded(
      child: Text(message ?? 'Ocurrió un error'),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context, 'OK');
        },
        child: const Text('Ok'),
      ),
    ],
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
