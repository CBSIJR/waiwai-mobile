import 'package:flutter/material.dart';

Widget buttonsHomeScreen(ScrollController scrollController,
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
                      key: const Key('filterButton'),
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
                key: const Key('scrollToTopButton'),
                onPressed: () {
                  scrollController.animateTo(
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
          );
