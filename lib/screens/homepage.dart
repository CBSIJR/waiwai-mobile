import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dicionario_waiwai/states/notifier.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          const Text('A random AWESOME idea:'),
          Text(appState.current.toLowerCase()),
          ElevatedButton(
            onPressed: () {
              debugPrint('button pressed!');
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
