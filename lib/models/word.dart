import 'base.dart';

import 'package:drift/drift.dart';
import 'user.dart';

@DataClassName('Word')
class Word extends Table with BaseTable {
  TextColumn get word => text()();
  TextColumn get phonemic => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updateAt => dateTime()();
  IntColumn get userId => integer().references(User, #id)();
}
