import 'package:dicionario_waiwai/models/reference.dart';
import 'package:dicionario_waiwai/models/word.dart';
import 'package:drift/drift.dart';
import 'base.dart';
import 'user.dart';

@DataClassName('Meaning')
class Meaning extends Table with BaseTable {
  TextColumn get meaning => text()();
  TextColumn get comment => text().nullable()();
  IntColumn get chapterId => integer().nullable()();
  IntColumn get entryId => integer().nullable()();
  IntColumn get wordId => integer().references(Word, #id)();
  IntColumn get referenceId => integer().references(Reference, #id)();
  IntColumn get userId => integer().references(User, #id)();
}
