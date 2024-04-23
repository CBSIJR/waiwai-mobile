import 'package:dicionario_waiwai/components/layouts.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:dicionario_waiwai/components/aboutcard.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
//   bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    // _checkLoginStatus(); // Verificar o status de login ao construir a página

    return MainScreenLayout(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                children: [
                  const Image(
                    image: AssetImage("assets/app-logo.png"),
                    height: 150,
                    width: 150,
                  ),
                  const Text("“Traduza e se comunique com praticidade!”",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Economize tempo com as suas traduções e concentre-se nas tarefas que realmente importam. Com o Dicionário Waiwai, você tem um repertório de palavras da língua indígena waiwai para o português!",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Divider(),
                  ),
                  const Text(
                    "Equipe",
                    style: TextStyle(fontFamily: "Nee"),
                  ),
                  TeamPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Método para verificar o status de login
//   void _checkLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _isLoggedIn = prefs.getBool('logado') ??
//           false; // Se não existir o status de login, assume como falso
//     });
//   }
}
