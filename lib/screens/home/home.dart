import 'package:dicionario_waiwai/components/buttons.dart';
import 'package:dicionario_waiwai/components/icons.dart';
import 'package:dicionario_waiwai/components/layouts.dart';
import 'package:dicionario_waiwai/components/word.dart';
import 'package:dicionario_waiwai/screens/word.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showButtonToTop = false;

  @override
  void initState() {
    super.initState();
    Provider.of<WordState>(context, listen: false).fetchWords();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 200) {
        setState(() {
          _showButtonToTop = true;
        });
      } else {
        setState(() {
          _showButtonToTop = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
        body: Consumer<WordState>(
          builder: (context, value, child) {
            if (value.isLoading && value.total == 0) {
              return const Center(
                child: CircularProgressIndicator(
                  key: Key('loadingProcess'),
                ),
              );
            }
            if (!value.isLoading && value.total == 0) {
              return Center(
                child: Align(
                    alignment: Alignment.center, child: svgAssetEmptyList),
              );
            }
            return _buildWordList(value);
          },
        ),
        floatingActionButton: buttonsHomeScreen(
          context,
          _scrollController,
          showButton: _showButtonToTop,
        ));
  }

  Widget _buildWordList(WordState state) {
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            if (_scrollController.offset >= 200) {
              setState(() {
                _showButtonToTop = true;
              });
            } else {
              setState(() {
                _showButtonToTop = false;
              });
            }
          }
          if (scrollNotification is ScrollEndNotification) {
            if (_scrollController.position.extentAfter == 0) {
              // if(state.getByPage())
              if (state.filter.isEmpty) {
                Provider.of<WordState>(context, listen: false).getByPage();
              } else {
                Provider.of<WordState>(context, listen: false).getByFilter();
              }
            }
          }

          return true;
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: state.words.length,
          itemBuilder: (context, index) {
            final word = state.words[index];
            return Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: WordComponent(
                word: word,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WordScreen(word: word);
                      },
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
