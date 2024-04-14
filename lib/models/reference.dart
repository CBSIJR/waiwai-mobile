import 'base.dart';

import 'package:drift/drift.dart';

@DataClassName('Reference')
class Reference extends Table with BaseTable {
  TextColumn get reference => text()();
  TextColumn get url => text().nullable()();
}
