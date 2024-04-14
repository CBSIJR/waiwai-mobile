import 'dart:ffi';

import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';

class WordState extends ChangeNotifier {
  final providerDb;
  late WordRepository _repository;
  final List _list = [];
  int _page = 1;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int get page => _page;
  WordState(this.providerDb) {
    _repository = WordRepository(providerDb);
  }

//   List<DbWord> get words => _list;
//   void addWord(DbWord word) {
//     _list.add(word);
//     notifyListeners();
//   }

//   void addWords(DbWords words) {
//     _list.addAll(words.toList());
//     notifyListeners();
//   }

  Future<void> loadList() async {
    _repository.listByPage(page: _page).listen((e) => print(e));
    if (_page > 1) return;
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    _page++;
    _isLoading = false;
    notifyListeners();
  }
}
