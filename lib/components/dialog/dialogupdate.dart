import 'package:flutter/material.dart';
import 'package:dicionario_waiwai/screens/home/home.dart';

updateFailedDialog(BuildContext context, String e) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro na atualização'),
          content: SingleChildScrollView(child: Text('$e.')),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );

updateSuccessDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atualização concluída'),
          content: const Text('Os dados foram importados com sucesso!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );

updateOnProgressDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) {
          return const AlertDialog(
            title: Text('Atualizando palavras'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    'Por favor, não feche o aplicativo. Sua base de dados local está sendo atualizada.'),
                SizedBox(height: 20),
                Center(
                  child: LinearProgressIndicator(),
                )
              ],
            ),
          );
        },
      ),
    );
