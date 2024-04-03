import 'package:cv/cv.dart';
import 'package:dicionario_waiwai/models/base.dart';
import 'dart:collection';

String tableUser = 'userTable';
String fullnameColumn = 'full_name';

class DbUser extends DbRecord {
  final fullname = CvField<String>(fullnameColumn);

  @override
  List<CvField> get fields => [id, fullname];

  String get schema {
    return '''
      CREATE TABLE "$tableUser" (
              ${id.key} INTEGER PRIMARY KEY,
              ${fullname.key} TEXT);''';
  }
}

DbUser snapshotToUser(Map<String, Object?> snapshot) {
  return DbUser()..fromMap(snapshot);
}

class DbUsers extends ListBase<DbUser> {
  final List<Map<String, Object?>> list;
  late List<DbUser?> _cacheNotes;

  DbUsers(this.list) {
    _cacheNotes = List.generate(list.length, (index) => null);
  }

  @override
  DbUser operator [](int index) {
    return _cacheNotes[index] ??= snapshotToUser(list[index]);
  }

  @override
  int get length => list.length;

  @override
  void operator []=(int index, DbUser? value) => throw 'read-only';

  @override
  set length(int newLength) => throw 'read-only';
}
