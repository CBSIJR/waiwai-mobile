// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dicionario_waiwai/models/legacy/meaning.dart';
import 'package:flutter/material.dart';

class MyExpantionTile extends StatefulWidget {
  final DbMeaning meaning;

  const MyExpantionTile({
    super.key,
    required this.meaning,
  });

  @override
  State<MyExpantionTile> createState() => _MyExpantionTileState();
}

class _MyExpantionTileState extends State<MyExpantionTile> {
//   @override
//   void initState() {
//     // super.initState();
//     // Chama a função para obter o nome da referência
//   }

  @override
  Widget build(BuildContext context) {
    String referenceName = widget.meaning.reference!.reference.valueOrThrow;
    String referencedisplayedName = referenceName.length > 30
        ? '${referenceName.substring(0, 15)}...'
        : referenceName;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(
            referencedisplayedName,
            style: const TextStyle(
              fontSize: 16,
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
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Siginificado: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                  text: widget.meaning.meaning.valueOrThrow),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.only(left: 0), // Ajuste aqui
                        //   child: RichText(
                        //     textAlign: TextAlign.left,
                        //     text: const TextSpan(
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 18,
                        //       ),
                        //       //   children: [// TODO: colocar para a palavra, não para significado
                        //       //     const TextSpan(
                        //       //       text: 'Fonema: ',
                        //       //       style: TextStyle(
                        //       //         fontWeight: FontWeight.bold,
                        //       //       ),
                        //       //     ),
                        //       //     TextSpan(
                        //       //       text: widget.meaning.word.phonemic == 'null' ||
                        //       //               widget.fonema.isEmpty
                        //       //           ? 'Indisponível'
                        //       //           : widget.fonema,
                        //       //     ),
                        //       //   ],
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 5),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 0), // Ajuste aqui
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Comentário: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.meaning.comment.valueOrNull ??
                                      'Indisponível',
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
