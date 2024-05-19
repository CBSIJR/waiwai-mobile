import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';

class WordState extends ChangeNotifier {
  final providerDb;
  late WordRepository _repository;
  bool _isLoading = false;
  static const int _pageSize = 50;

  int _page = 1;
  final WordList _list = [];

  final CategoryList _listCategories = [];
  Category categorySelected =
      const Category(id: 0, category: 'Sem categoria', description: '');
  late int _totalCategories = 0;

  late int _total = 0;
  late int _totalFiltered = 0;
  late int _pageTotal = 0;
  late int _pageTotalFiltered = 0;

  String _filterOlder = '';
  int _pageFiltered = 1;
  final WordList _listFiltered = [];

  String filter = '';
//   set filter(String value) => _filter = value;

  bool get isLoading => _isLoading;
  int get total => _total;
  int get page => _page;
  int get pageSize => _pageSize;
  List get words {
    // return _list;
    if (_listFiltered.isEmpty) return _list;
    return _listFiltered;
  }

  List get pageFiltered => _listFiltered;
  List<Category> get categories => _listCategories;

  WordState(this.providerDb) {
    _repository = WordRepository(providerDb);
  }

  Future<void> fetchWords() async {
    if (_page > 1 && _total != 0) return;
    _isLoading = true;
    _list.addAll(await _repository.getByPage(page: _page, size: pageSize));
    _total = await _repository.count();
    _pageTotal = (_total / _pageSize).ceil();
    if (total != 0) _page++;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    if (_totalCategories != 0) return;
    _isLoading = true;
    _listCategories.addAll(await _repository.getAllCategories());
    if (_listCategories.isNotEmpty) categorySelected = _listCategories.first;
    _totalCategories = _listCategories.length;
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

  Future<void> getByFilter() async {
    _isLoading = true;
    if ((filter.isEmpty & [0, 1].contains(categorySelected.id)) |
        (filter != _filterOlder)) {
      _filterOlder = filter;
      _listFiltered.clear();
      _pageFiltered = 1;
      _totalFiltered = 0;
      _pageTotalFiltered = 0;
    }

    if ((filter.isNotEmpty |
            (!([0, 1].contains(categorySelected.id)) & filter.isEmpty)) &
        (filter == _filterOlder)) {
      _totalFiltered = await _repository.count(criteria: filter);
      _pageTotalFiltered = (_totalFiltered / _pageSize).ceil();
      _listFiltered.addAll(await _repository.getByPage(
          criteria: (filter, categorySelected.id),
          page: _pageFiltered,
          size: _pageSize));
      print(categorySelected.id);
      _pageFiltered++;
    }
    _isLoading = false;
    notifyListeners();
  }
}
