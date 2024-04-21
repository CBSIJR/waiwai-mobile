import 'dart:ffi';

import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';

class WordState extends ChangeNotifier {
  final providerDb;
  late WordRepository _repository;
  final WordList _list = [];
  int _page = 1;
  int _pageFiltered = 1;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late int _total = 0;
  late int _pageTotal = 0;
  final int _pageSize = 50;
  final WordList _listFiltered = [];

  String _filter = '';
  String _filterOlder = '';

  WordList get listFiltered => _listFiltered;
  int get total => _total;
  int get page => _page;
  int get pageSize => _pageSize;
  List get words => _list;
  List get pageFiltered => _listFiltered;
  WordState(this.providerDb) {
    _repository = WordRepository(providerDb);
  }

  Future<void> fetchWords() async {
    if (_page > 1 && _total != 0) return;
    _isLoading = true;
    _list.addAll(await _repository.getByPage(page: _page, size: pageSize));
    _total = await _repository.count();
    _pageTotal = (_total / _pageSize).ceil();
    _page++;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getByPage() async {
    if (_isLoading || _page > _pageTotal) return;
    _isLoading = true;
    _list.addAll(await _repository.getByPage(page: _page, size: _pageSize));
    _page++;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getByFilter(String criteria) async {
    // TODO: implement getByFilter
    if (criteria.isEmpty) return;
    _isLoading = true;
    _listFiltered
        .addAll(await _repository.getByPage(page: _page, size: _pageSize));
    _isLoading = false;
    notifyListeners();
  }
}
