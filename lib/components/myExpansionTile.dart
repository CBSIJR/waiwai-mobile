// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';

class MyExpantionTile extends StatefulWidget {
  MeaningWithReference meaning;
  int index;

  MyExpantionTile({
    super.key,
    required this.meaning,
    required this.index,
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
                        // RichText(
                        //   textAlign: TextAlign.left,
                        //   text: TextSpan(
                        //     style: const TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 15,
                        //     ),
                        //     children: [
                        //       const TextSpan(
                        //         text: 'Significado: ',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       TextSpan(text: widget.meaning.$1.meaning),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: 5),
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
                        // RichText(
                        //   textAlign: TextAlign.left,
                        //   text: TextSpan(
                        //     style: const TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 15,
                        //     ),
                        //     children: [
                        //       TextSpan(
                        //         text:
                        //             'Referência: ${}',
                        //         style: const TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
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
