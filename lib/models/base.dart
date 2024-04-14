import 'package:drift/drift.dart';

// Tables can mix-in common definitions if needed
mixin BaseTable on Table {
  IntColumn get id => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

// // Tables can mix-in common definitions if needed
// mixin AutoIncrementingPrimaryKey on Table {
//   IntColumn get id => integer().autoIncrement()();
// }
