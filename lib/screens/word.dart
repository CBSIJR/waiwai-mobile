import 'package:dicionario_waiwai/components/layouts.dart';
import 'package:flutter/material.dart';
// import 'package:dicionario_waiwai/components/myExpansionTile.dart';

class WordScreen extends StatefulWidget {
//   final List<Meaning> meanings;
  final word;
  const WordScreen({super.key, required this.word
      // required this.meanings,
      });

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
//   bool _isLoggedIn = false;

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
    // _checkLoginStatus();
    return MainScreenLayout(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Palavra', // TODO: Implementar palavra via provider
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Significado(s)",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  100, // widget.total_words, #TODO: Implementar total_words via provider
                              itemBuilder: (context, index) {
                                //final meaning = widget.word.meanings[index];
                                return Text("olaaa");
                                // return Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       borderRadius: BorderRadius.circular(20),
                                //       boxShadow: [
                                //         BoxShadow(
                                //           color: Colors.grey.withOpacity(0.5),
                                //           spreadRadius: 3,
                                //           blurRadius: 7,
                                //           offset: const Offset(0, 3),
                                //         ),
                                //       ],
                                //     ),
                                //     child: MyExpantionTile(
                                //       meaning: meaning.,
                                //     ),
                                //   ),
                                // );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 10,
            ),
            child: Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 23),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'assets/nothumb.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // Scaffold(
    //   backgroundColor: const Color(0xFFF2F2F2),
    //   appBar: MyAppBar(),
    //   drawer: _isLoggedIn ? const SideBarLogged() : const SideBarNotLogged(),
    //   body:
    // );
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
