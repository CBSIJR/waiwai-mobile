import 'package:dicionario_waiwai/components/layouts.dart';
import 'package:dicionario_waiwai/components/word.dart';
import 'package:dicionario_waiwai/screens/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  bool _showArrowUpButton = false;

  @override
  void initState() {
    super.initState();
    Provider.of<WordState>(context, listen: false).fetchWords();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 200) {
        setState(() {
          _showArrowUpButton = true;
        });
      } else {
        setState(() {
          _showArrowUpButton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
        body: Consumer<WordState>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return _buildWordList(value);
          },
        ),
        floatingActionButton: _showArrowUpButton
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: AnimatedOpacity(
                        opacity: _showArrowUpButton ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: FloatingActionButton(
                          onPressed: () {
                            // ShowFilterModal(context, _filterWords);
                          },
                          child: const Icon(
                            Icons.filter_list,
                            color: Colors.black,
                          ),
                        )),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            : FloatingActionButton(
                onPressed: () {
                  // ShowFilterModal(context, _filterWords);
                },
                child: const Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
              ));
  }

  Widget _buildWordList(WordState state) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification) {
          if (_scrollController.offset >= 200) {
            setState(() {
              _showArrowUpButton = true;
            });
          } else {
            setState(() {
              _showArrowUpButton = false;
            });
          }
        }
        if (scrollNotification is ScrollEndNotification) {
          if (_scrollController.position.extentAfter == 0) {
            //Provider.of<WordState>(context, listen: false).getByPage();
          }
        }

        return true;
      },
      child: state.words.isNotEmpty
          ? ListView.builder(
              controller: _scrollController,
              itemCount: state.words.length,
              itemBuilder: (context, index) {
                final word = state.words[index];
                // if (index == state.total) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
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
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/not-found.svg',
                    semanticsLabel: 'My SVG Image',
                    height: 300,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
    );
  }
}
