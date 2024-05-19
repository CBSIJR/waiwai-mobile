import 'dart:ffi';

import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dicionario_waiwai/screens/home/state.dart';

void showFilterModal(BuildContext context) {
  WordState stateFilter = Provider.of<WordState>(context, listen: false);
  TextEditingController formWordController =
      TextEditingController(text: stateFilter.filter);

  final TextEditingController categoryController =
      TextEditingController(text: stateFilter.categorySelected.category);

  showModalBottomSheet(
    isScrollControlled:
        true, // Define como true para permitir que o modal seja rolado quando o teclado estiver ativo
    context: context,
    shape: ShapeBorderTween(
      begin: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      end: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ).lerp(0.5),

    builder: (BuildContext context) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                top: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.search),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: formWordController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Digite sua busca',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: DropdownMenu<Category>(
                      leadingIcon: const Icon(Icons.interests_outlined),
                      width: 389,
                      enabled: (stateFilter.categorySelected.id != 0),
                      inputDecorationTheme: InputDecorationTheme(
                        constraints: const BoxConstraints(maxHeight: 50),
                        outlineBorder: const BorderSide(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      initialSelection: stateFilter.categorySelected,
                      controller: categoryController,
                      requestFocusOnTap: true,
                      onSelected: (Category? category) {
                        stateFilter.categorySelected = stateFilter.categories
                            .firstWhere(
                                (element) => element.id == category!.id);
                      },
                      dropdownMenuEntries: stateFilter.categories
                          .map<DropdownMenuEntry<Category>>(
                              (Category category) {
                        return DropdownMenuEntry<Category>(
                          value: category,
                          label: category.category,
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final formword = formWordController.text;
                          stateFilter.filter = formword;
                          stateFilter.getByFilter();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Buscar',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
