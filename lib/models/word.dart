import 'package:cv/cv.dart';
import 'package:dicionario_waiwai/models/base.dart';

String wordColumn = 'word';
String phonemicColumn = 'phonemic';
String createdAtColumn = 'created_at';
String updateAtColumn = 'update_at';
String userIdColumn = 'user_id';

class DbMeaning extends DbRecord {
  final word = CvField<String>(wordColumn);
  final phonemic = CvField<String?>(phonemicColumn);
  final createdAt = CvField<DateTime>(createdAtColumn);
  final updateAt = CvField<DateTime>(updateAtColumn);
  final userId = CvField<int>(userIdColumn);

  @override
  List<CvField> get fields => [id, word, phonemic, createdAt, updateAt, userId];
}
