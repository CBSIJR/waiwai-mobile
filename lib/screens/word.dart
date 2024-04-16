import 'package:dicionario_waiwai/components/icons.dart';
import 'package:dicionario_waiwai/components/image.dart';
import 'package:dicionario_waiwai/components/layouts.dart';
import 'package:dicionario_waiwai/components/myExpansionTile.dart';
import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';
// import 'package:dicionario_waiwai/components/myExpansionTile.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WordScreen extends StatefulWidget {
  final WordWithMeaning word;
  const WordScreen({super.key, required this.word
      // required this.meanings,
      });

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
      body: ListView(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Significado(s)",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.word.$2.length,
                              itemBuilder: (context, index) {
                                final meaning = widget.word.$2[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                    child: MyExpantionTile(
                                        meaning: meaning, index: index),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
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
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Anexo(s)",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    // aspectRatio: 2.0,
                    // height: 200,
                    // width: MediaQuery.of(context).size.width,
                    // viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                  ),
                  items: [1, 2].map((i) {
                    return Container(
                        child: imageContainer(context, svgAssetNoThumb));
                    // return Builder(
                    //   builder: (BuildContext context) {
                    //     return Container(
                    //       width: MediaQuery.of(context).size.width,
                    //       margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    //       // decoration: const BoxDecoration(color: Colors.amber),
                    //       child: Container(
                    //         height: 200,
                    //         margin: const EdgeInsets.symmetric(horizontal: 23),
                    //         alignment: Alignment.center,
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(18),
                    //           child: svgAssetNoThumb,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
