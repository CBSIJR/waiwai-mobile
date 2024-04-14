import 'package:dicionario_waiwai/repositories/meanings.dart';
import 'package:dicionario_waiwai/repositories/references.dart';
import 'package:dicionario_waiwai/repositories/words.dart';
import 'package:dicionario_waiwai/repositories/users.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:synchronized/synchronized.dart';
import 'dart:async';
import 'package:dicionario_waiwai/models/legacy/base.dart';
import 'package:dicionario_waiwai/models/legacy/user.dart';
import 'package:dicionario_waiwai/models/legacy/reference.dart';
import 'package:dicionario_waiwai/models/legacy/word.dart';
import 'package:dicionario_waiwai/models/legacy/meaning.dart';

class DbProvider {
  final lock = Lock(reentrant: true);
  final DatabaseFactory dbFactory;
  final _updateTriggerController = StreamController<bool>.broadcast();
  Database? db;

  // Repositories
  late Users users;
  late References references;
  late Words words;
  late Meanings meanings;

  DbProvider(this.dbFactory) {
    users = Users(this);
    references = References(this);
    words = Words(this);
    meanings = Meanings(this);
  }

  Future openPath(String path) async {
    db = await dbFactory.openDatabase(path,
        options: OpenDatabaseOptions(
            version: kVersion1,
            onCreate: (db, version) async {
              await _createDb(db);
            },
            onUpgrade: (db, oldVersion, newVersion) async {
              if (oldVersion < kVersion1) {
                await _createDb(db);
              }
            }));
  }

  void _triggerUpdate() {
    _updateTriggerController.sink.add(true);
  }

  Future<Database?> get ready async => db ??= await lock.synchronized(() async {
        if (db == null) {
          await open();
        }
        return db;
      });

  Future _createDb(Database db) async {
    var tableDbUser = DbUser();
    var tableDbReference = DbReference();
    var tableDbWord = DbWord();
    var tableDbMeaning = DbMeaning();

    await db.execute('DROP TABLE IF EXISTS $tableMeaning;');
    await db.execute('DROP TABLE IF EXISTS $tableReference;');
    await db.execute('DROP TABLE IF EXISTS $tableWord;');
    await db.execute('DROP TABLE IF EXISTS $tableUser;');

    await db.execute(tableDbUser.schema);
    await db.execute(tableDbReference.schema);
    await db.execute(tableDbWord.schema);
    await db.execute(tableDbMeaning.schema);

    _triggerUpdate();
  }

  Future open() async {
    await openPath(await fixPath(dbName));
  }

  Future<String> fixPath(String path) async => path;

  Future close() async {
    await db!.close();
  }

  Future deleteDb() async {
    await dbFactory.deleteDatabase(await fixPath(dbName));
  }
}
