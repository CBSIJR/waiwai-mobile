import 'package:dicionario_waiwai/components/icons.dart';
import 'package:dicionario_waiwai/components/image.dart';
import 'package:dicionario_waiwai/components/layouts.dart';
import 'package:dicionario_waiwai/components/myExpansionTile.dart';
import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WordScreen extends StatefulWidget {
  final WordWithMeaning word;
  const WordScreen({super.key, required this.word});

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          widget.word.$1.word,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
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
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Significado(s)",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.word.$2.length,
                              itemBuilder: (context, index) {
                                final meaning = widget.word.$2[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 4),
                                  child: Container(
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
                                    child: MyExpantionTile(meaning: meaning),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Anexo(s)",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              key: const Key('noContent'),
                              child: svgAssetNoThumb,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // CarouselSlider(
                //   options: CarouselOptions(
                //     enlargeCenterPage: true,
                //     scrollDirection: Axis.horizontal,
                //     autoPlay: true,
                //   ),
                //   items: [1, 2].map((i) {
                //     return Container(
                //         child: imageContainer(context, svgAssetNoThumb));
                //   }).toList(),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
