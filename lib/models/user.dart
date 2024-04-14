import 'base.dart';

import 'package:drift/drift.dart';

@DataClassName('User')
class User extends Table with BaseTable {
  TextColumn get fullName => text().named('full_name')();
}
