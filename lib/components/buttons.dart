import 'package:dicionario_waiwai/components/modal.dart';
import 'package:flutter/material.dart';

const Color colorBack = Color.fromARGB(255, 166, 52, 41);

Widget buttonsHomeScreen(
        BuildContext context, ScrollController scrollController,
        {bool showButton = false}) =>
    showButton
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: AnimatedOpacity(
                    opacity: showButton ? 1.0 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: FloatingActionButton(
                      heroTag: "filterButton",
                      key: const Key('filterButton'),
                      backgroundColor: colorBack,
                      onPressed: () {
                        showFilterModal(context);
                      },
                      child: const Icon(
                        Icons.filter_list,
                        key: Key('filterIcon'),
                        color: Colors.white,
                      ),
                    )),
              ),
              FloatingActionButton(
                heroTag: "scrollToTopButton",
                key: const Key('scrollToTopButton'),
                backgroundColor: colorBack,
                onPressed: () {
                  scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(
                  Icons.arrow_upward,
                  key: Key('scrollToTopIcon'),
                  color: Colors.white,
                ),
              ),
            ],
          )
        : FloatingActionButton(
            heroTag: "filterButton",
            key: const Key('filterButton'),
            backgroundColor: colorBack,
            onPressed: () {
              showFilterModal(context);
            },
            child: const Icon(
              Icons.filter_list,
              key: Key('filterIcon'),
              color: Colors.white,
            ),
          );
