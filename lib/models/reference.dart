import 'package:cv/cv.dart';
import 'package:dicionario_waiwai/models/base.dart';
import 'dart:collection';

String tableReference = 'referenceTable';
String columnReference = 'reference';
String columnUrl = 'url';

class DbReference extends DbRecord {
  final reference = CvField<String>(columnReference);
  final url = CvField<String>(columnUrl);

  @override
  List<CvField> get fields => [id, reference, url];

  String get schema => '''
    CREATE TABLE "$tableReference" (
          ${id.key} INTEGER PRIMARY KEY,
          ${reference.key} TEXT,
          ${url.key} TEXT);''';
}

DbReference snapshotToReference(Map<String, Object?> snapshot) {
  return DbReference()..fromMap(snapshot);
}

class DbMeanings extends ListBase<DbReference> {
  final List<Map<String, Object?>> list;
  late List<DbReference?> _cacheNotes;

  DbMeanings(this.list) {
    _cacheNotes = List.generate(list.length, (index) => null);
  }

  @override
  DbReference operator [](int index) {
    return _cacheNotes[index] ??= snapshotToReference(list[index]);
  }

  @override
  int get length => list.length;

  @override
  void operator []=(int index, DbReference? value) => throw 'read-only';

  @override
  set length(int newLength) => throw 'read-only';
}
