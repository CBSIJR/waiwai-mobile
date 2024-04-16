// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';

class MyExpantionTile extends StatefulWidget {
  final MeaningWithReference meaning;

  const MyExpantionTile({
    super.key,
    required this.meaning,
  });

  @override
  State<MyExpantionTile> createState() => _MyExpantionTileState();
}

class _MyExpantionTileState extends State<MyExpantionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Theme(
        data: ThemeData(
          useMaterial3: true,
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: true,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            widget.meaning.$1.meaning,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 0), // Ajuste aqui
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Comentário: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.meaning.$1.comment ?? '-',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 0), // Ajuste aqui
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Referência: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.meaning.$2.reference,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
