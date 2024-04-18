import 'package:dicionario_waiwai/database/database.dart';
import 'package:dicionario_waiwai/screens/home/home.dart';
import 'package:dicionario_waiwai/screens/home/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late AppDatabase databaseProvider;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databaseProvider = AppDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => WordState(databaseProvider)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
