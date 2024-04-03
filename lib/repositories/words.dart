import 'package:dicionario_waiwai/models/base.dart';
import 'package:dicionario_waiwai/models/word.dart';
import 'package:sqflite_common/sqlite_api.dart';

class Words {
  Database? db;

  Future<DbWord?> getNote(int? id) async {
    var list = (await db!.query(tableWord,
        columns: [
          columnId,
          columnWord,
          columnPhonemic,
          columnCreatedAt,
          columnUpdateAt,
          columnUserId
        ],
        where: '$columnId = ?',
        whereArgs: <Object?>[id]));
    if (list.isNotEmpty) {
      return DbWord()..fromMap(list.first);
    }
    return null;
  }

  Future<DbWords> getList({int? offset, int? limit, bool? descending}) async {
    // devPrint('fetching $offset $limit');
    var list = (await db!.query(tableWord,
        columns: [
          columnId,
          columnWord,
          columnPhonemic,
          columnCreatedAt,
          columnUpdateAt,
          columnUserId
        ],
        orderBy: '$columnWord ${(descending ?? false) ? 'ASC' : 'DESC'}',
        limit: limit,
        offset: offset));
    return DbWords(list);
  }
}
