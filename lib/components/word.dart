import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';

class WordComponent extends StatefulWidget {
  final VoidCallback onTap;
  final WordWithMeaning word;

  const WordComponent({
    super.key,
    required this.onTap,
    required this.word,
  });

  @override
  State<WordComponent> createState() => _WordComponentState();
}

class _WordComponentState extends State<WordComponent> {
  @override
  Widget build(BuildContext context) {
    String wordText = widget.word.$1.word;
    final meaningList = widget.word.$2.map((e) => e.$1.meaning).toList();
    String meaningText = meaningList.join(', ');
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
              wordText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              meaningText, // TODO: Implementar significado via provider
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
