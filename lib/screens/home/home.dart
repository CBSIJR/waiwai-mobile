import 'package:dicionario_waiwai/components/layouts.dart';
// import 'package:dicionario_waiwai/components/word.dart';
// import 'package:dicionario_waiwai/main.dart';
// import 'package:dicionario_waiwai/models/word.dart';
// import 'package:dicionario_waiwai/providers/provider.dart';
// import 'package:dicionario_waiwai/screens/word.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:dicionario_waiwai/components/layouts/appbar.dart';
// import 'package:provider/provider.dart';
// import '../components/layouts/sidebar.dart';
// import 'package:dicionario_waiwai/components/sideBarLogged.dart';
// import 'package:dicionario_waiwai/components/sidebarNotLogged.dart';
// import 'package:dicionario_waiwai/components/modal.dart';
// import 'package:dicionario_waiwai/components/word.dart';
// import 'package:dicionario_waiwai/models/wordModels.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dicionario_waiwai/screens/word.dart';
// import 'package:dicionario_waiwai/services/bd.dart';

import 'state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final ScrollController _scrollController = ScrollController();

  // bool _showArrowUpButton = false;
//   bool _isLoggedIn = false;
//   late DatabaseHelper _databaseHelper;
  // List<Word> _filteredWords = [];
  // List<List<Meaning>> _meaningsList = [];

  @override
  void initState() {
    super.initState();
    Provider.of<WordState>(context, listen: false).loadList();

    // _scrollController.addListener(() {
    //   _scrollController.offset >= 200
    //       ? setState(() {
    //           _showArrowUpButton = true;
    //         })
    //       : setState(() {
    //           _showArrowUpButton = false;
    //         });
    // });
    // _loadWords().then((value) => null);
  }

//     // _databaseHelper = DatabaseHelper();
//     // _checkLoginStatus();
//     // _loadWords();
//     /
//   }

  // void _clearFilter() {
  //   setState(() {
  //     _filteredWords.clear();
  //   });
  // }

  // void _filterWords(String query) {
  //   setState(() {
  //     _filteredWords = _words
  //         .where(
  //             (word) => word.word.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }
//   Future<void> _loadWords() async {
//     setState(() {
//       _isLoading = true; // Mostrar indicador de progresso
//     });
//     if (_words.isEmpty) {
//       _words = await providerDb.words.getList();
//       for (var word in _words) {
//         final meanings =
//             await providerDb.meanings.getByWordId(wordId: word.id.valueOrThrow);
//         word.meanings = meanings;
//       }
//     }
//     setState(() {
//       _words = _words;
//       _isLoading = false;
//     });
//   }
  // void _loadWords() async {
  //   setState(() {
  //     _isLoading = true; // Mostrar indicador de progresso
  //   });

  //   if (_meaningsList.isEmpty) {
  //     final meanings = await _databaseHelper.getMeanings();
  //     final wordIds =
  //         meanings.map<int>((meaning) => meaning['word_id'] as int).toSet();

  //     _words = await Future.wait(
  //         wordIds.map((wordId) => _databaseHelper.getWordById(wordId)));

  //     _words
  //         .sort((a, b) => a.word.toLowerCase().compareTo(b.word.toLowerCase()));

  //     _meaningsList = List.generate(_words.length, (index) {
  //       final wordId = _words[index].id;
  //       return meanings
  //           .where((meaning) => meaning['word_id'] == wordId)
  //           .map((meaning) => Meaning.fromJson(meaning))
  //           .toList();
  //     });
  //   }

  //   setState(() {
  //     _meaningsList = _meaningsList;
  //     _isLoading = false;
  //   });
  // }

  // void _checkLoginStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _isLoggedIn = prefs.getBool('logado') ?? false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // We can use the AsyncValue to handle loading/error states and show the data.
    // return ChangeNotifierProvider(
    //   create: (_) => WordState(),
    //   child: const MainScreenLayout(body: Text("aaaa")),
    // );
    return MainScreenLayout(
        //body: Text("aaaa"));
        body: Consumer<WordState>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return const Text("Itens carregados");
      //return _buildWordList(words);
    }));
    // const Scaffold(
    //     backgroundColor: Color(0xFFF2F2F2),
    //     appBar: MyAppBar(),
    //     body: Text("Home Page"),
    //     drawer: SideBar()

    //   drawer: _isLoggedIn ? const SideBarLogged() : const SideBarNotLogged(),
    //   body: _isLoading
    //       ? const Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               CircularProgressIndicator(),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Text("Organizando as palavras...")
    //             ],
    //           ),
    //         )
    //       : _filteredWords.isNotEmpty
    //           ? _buildWordList(_filteredWords)
    //           : _words.isNotEmpty
    //               ? _buildWordList(_words)
    //               : const Center(
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Image(
    //                         image: AssetImage('assets/words_not_found.png'),
    //                       ),
    //                       SizedBox(
    //                         height: 50,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //   //   floatingActionButton: _showArrowUpButton
    //   ? Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(left: 30),
    //           child: AnimatedOpacity(
    //             opacity: _showArrowUpButton ? 1.0 : 0.0,
    //             duration: const Duration(milliseconds: 500),
    //             child: _filteredWords.isEmpty
    //                 ? FloatingActionButton(
    //                     onPressed: () {
    //                       ShowFilterModal(context, _filterWords);
    //                     },
    //                     child: const Icon(
    //                       Icons.filter_list,
    //                       color: Colors.black,
    //                     ),
    //                   )
    //                 : FloatingActionButton(
    //                     onPressed: () {
    //                       _clearFilter();
    //                     },
    //                     child: const Icon(
    //                       Icons.filter_list_off,
    //                       color: Colors.black,
    //                     ),
    //                   ),
    //           ),
    //         ),
    //         FloatingActionButton(
    //           onPressed: () {
    //             _scrollController.animateTo(
    //               0,
    //               duration: const Duration(milliseconds: 500),
    //               curve: Curves.easeInOut,
    //             );
    //           },
    //           child: const Icon(
    //             Icons.arrow_upward,
    //             color: Colors.black,
    //           ),
    //         ),
    //       ],
    //     )
    //   : _filteredWords.isEmpty
    //       ? FloatingActionButton(
    //           onPressed: () {
    //             ShowFilterModal(context, _filterWords);
    //           },
    //           child: const Icon(
    //             Icons.filter_list,
    //             color: Colors.black,
    //           ),
    //         )
    //       : FloatingActionButton(
    //           onPressed: () {
    //             _clearFilter();
    //           },
    //           child: const Icon(
    //             Icons.filter_list_off,
    //             color: Colors.black,
    //           ),
    //         ),
    // );
  }

  // Widget _buildLoadingWords() {
  //     return const Center(
  //     child: CircularProgressIndicator(),
  //     );
  // }

//   Widget _buildWordList(words) {
//     return NotificationListener<ScrollNotification>(
//       onNotification: (scrollNotification) {
//         if (scrollNotification is ScrollEndNotification) {
//           if (_scrollController.offset >= 200) {
//             setState(() {
//               _showArrowUpButton = true;
//             });
//           } else {
//             setState(() {
//               _showArrowUpButton = false;
//             });
//           }
//         }
//         return true;
//       },
//       child: ListView.builder(
//         controller: _scrollController,
//         itemCount: words.length,
//         itemBuilder: (context, index) {
//           final word = words[index];
//           // final meanings = _meaningsList[index];
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: WordComponent(
//               word: word,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return WordScreen(
//                         word: word,
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
}
