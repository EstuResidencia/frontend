import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = const AlertDialog(
    titlePadding: EdgeInsets.zero,
    actionsPadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 20),
        Text(
          "Cargando...",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.normal,
          ),
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
    titlePadding: const EdgeInsets.all(0),
    content: Text(
      message ?? 'Ocurrió un error',
      textAlign: TextAlign.center,
      style: const TextStyle(
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
          Navigator.of(context, rootNavigator: true).pop();
        },
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF5E82C8),
        ),
        child: const Text(
          'Ok',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showSuccessDialog(BuildContext context, String? message,
    {Function()? onPressed}) {
  AlertDialog alert = AlertDialog(
    titlePadding: const EdgeInsets.all(0),
    content: Text(
      message ?? 'Ocurrió un error',
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
      ),
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    actionsPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      TextButton(
        onPressed: onPressed ??
            () {
              Navigator.of(context, rootNavigator: true).pop();
            },
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF5E82C8),
        ),
        child: const Text(
          'Ok',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
