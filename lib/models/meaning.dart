import 'package:cv/cv.dart';
import 'package:dicionario_waiwai/models/base.dart';
import 'dart:collection';

String tableMeaning = 'meaningTable';
String columnMeaning = 'meaning';
String columnComment = 'comment';
String columnChapterId = 'chapter_id';
String columnEntryId = 'entry_id';

class DbMeaning extends DbRecord {
  final meaning = CvField<String>(columnMeaning);
  final comment = CvField<String>(columnComment);
  final chapterId = CvField<int>(columnChapterId);
  final entryId = CvField<int>(columnEntryId);
  final wordId = CvField<int>(columnWordId);
  final referenceId = CvField<int>(columnReferenceId);
  final userId = CvField<int>(columnUserId);

  @override
  List<CvField> get fields =>
      [id, meaning, comment, chapterId, entryId, wordId, referenceId, userId];

  String get schema {
    return '''
      CREATE TABLE "$tableMeaning" (
              ${id.key} INTEGER PRIMARY KEY,
              ${meaning.key} TEXT,
              ${comment.key} TEXT,
              ${chapterId.key} INTEGER,
              ${entryId.key} INTEGER,
              ${wordId.key} INTEGER,
              ${referenceId.key} INTEGER,
              ${userId.key} INTEGER,
              FOREIGN KEY(${referenceId.key}) REFERENCES "referenceTable" (id),
              FOREIGN KEY(${userId.key}) REFERENCES "userTable" (id));''';
  }
}

DbMeaning snapshotToMeaning(Map<String, Object?> snapshot) {
  return DbMeaning()..fromMap(snapshot);
}

class DbMeanings extends ListBase<DbMeaning> {
  final List<Map<String, Object?>> list;
  late List<DbMeaning?> _cacheNotes;

  DbMeanings(this.list) {
    _cacheNotes = List.generate(list.length, (index) => null);
  }

  @override
  DbMeaning operator [](int index) {
    return _cacheNotes[index] ??= snapshotToMeaning(list[index]);
  }

  @override
  int get length => list.length;

  @override
  void operator []=(int index, DbMeaning? value) => throw 'read-only';

  @override
  set length(int newLength) => throw 'read-only';
}
