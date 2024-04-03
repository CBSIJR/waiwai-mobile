import 'package:cv/cv.dart';
import 'package:dicionario_waiwai/models/base.dart';
import 'dart:collection';

String tableWord = 'wordTable';

String columnWord = 'word';
String columnPhonemic = 'phonemic';

class DbWord extends DbRecord {
  final word = CvField<String>(columnWord);
  final phonemic = CvField<String?>(columnPhonemic);
  final createdAt = CvField<DateTime>(columnCreatedAt);
  final updateAt = CvField<DateTime>(columnUpdateAt);
  final userId = CvField<int>(columnUserId);

  @override
  List<CvField> get fields => [id, word, phonemic, createdAt, updateAt, userId];

  String get schema => '''
  CREATE TABLE $tableWord ("
          "${id.key} INTEGER PRIMARY KEY,"
          "${word.key} TEXT,"
          "${phonemic.key} TEXT,"
          "${createdAt.key} TEXT,"
          "${updateAt.key} TEXT,"
          "${userId.key} INTEGER,"
          "FOREIGN KEY($userId) REFERENCES "userTable"(id));''';
}

DbWord snapshotToWord(Map<String, Object?> snapshot) {
  return DbWord()..fromMap(snapshot);
}

class DbWords extends ListBase<DbWord> {
  final List<Map<String, Object?>> list;
  late List<DbWord?> _cacheNotes;

  DbWords(this.list) {
    _cacheNotes = List.generate(list.length, (index) => null);
  }

  @override
  DbWord operator [](int index) {
    return _cacheNotes[index] ??= snapshotToWord(list[index]);
  }

  @override
  int get length => list.length;

  @override
  void operator []=(int index, DbWord? value) => throw 'read-only';

  @override
  set length(int newLength) => throw 'read-only';
}
