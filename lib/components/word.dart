import 'package:dicionario_waiwai/models/legacy/word.dart';
import 'package:flutter/material.dart';

class WordComponent extends StatefulWidget {
  final VoidCallback onTap;
  final DbWord word;
  // final List<Meaning> meanings;

  const WordComponent({
    super.key,
    required this.onTap,
    required this.word,
    // required this.meanings,
  });

  @override
  State<WordComponent> createState() => _WordComponentState();
}

class _WordComponentState extends State<WordComponent> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String meaningText = '';
    for (var i = 0; i < widget.word.meanings.length; i++) {
      // append
      meaningText += widget.word.meanings[i].meaning.valueOrThrow;
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.word.word.valueOrThrow,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              meaningText,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
