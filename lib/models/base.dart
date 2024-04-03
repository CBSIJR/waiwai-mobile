import 'package:cv/cv.dart';

const String dbName = 'waiwai.db';
const int kVersion1 = 1;

// Common columns
String columnId = 'id';
String columnCreatedAt = 'created_at';
String columnUpdateAt = 'update_at';

// Relationships (foreign keys)
String columnWordId = 'word_id';
String columnReferenceId = 'reference_id';
String columnUserId = 'user_id';

abstract class DbRecord extends CvModelBase {
  final id = CvField<int>(columnId);
}
