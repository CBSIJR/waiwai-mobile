import 'package:cv/cv.dart';

const String dbName = 'waiwai.db';
const int kVersion1 = 1;

String idColumn = 'id';

abstract class DbRecord extends CvModelBase {
  final id = CvField<int>(idColumn);
}
