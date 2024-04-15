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

  bool _showArrowUpButton = false;
  @override
  void initState() {
    super.initState();
    Provider.of<WordState>(context, listen: false).fetchWords();
  }

  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
        body: Consumer<WordState>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      print(value.words.length);
      return _buildWordList(value);
    }));
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
        return true;
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: state.total,
        itemBuilder: (context, index) {
          final word = state.words[index];
          if (index == state.total) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: WordComponent(
              word: word,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return WordScreen(word: word);
                //     },
                //   ),
                // );
              },
            ),
          );
        },
      ),
    );
  }
}
