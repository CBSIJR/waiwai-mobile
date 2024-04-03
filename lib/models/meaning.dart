import 'package:cv/cv.dart';
import 'package:dicionario_waiwai/models/base.dart';

// String tableName = 'meaningTable';
// String meaningColumn = 'meaning';
// String commentColumn = 'comment';
// String chapterIdColumn = 'chapter_id';
// String entryIdColumn = 'entry_id';
// String wordIdColumn = 'word_id';
// String referenceIdColumn = 'reference_id';
// String userIdColumn = 'user_id';

// String schemaMeaning = '''
// CREATE TABLE $tableName ("
//           "$idColumn INTEGER PRIMARY KEY,"
//           "$meaningColumn TEXT,"
//           "$commentColumn TEXT,"
//           "$chapterIdColumn INTEGER,"
//           "$entryIdColumn INTEGER,"
//           "$wordIdColumn INTEGER,"
//           "$referenceIdColumn INTEGER,"
//           "$userIdColumn INTEGER,"
//           "FOREIGN KEY($referenceIdColumn) REFERENCES ${Reference.tableName}(${Reference.idColumn}) ON DELETE CASCADE,"
//           "FOREIGN KEY($userIdColumn) REFERENCES ${User.tableName}(${User.idColumn}) ON DELETE CASCADE);
// '''

class DbMeaning extends DbRecord {
  String tableName = 'meaningTable';

  final meaning = CvField<String>('meaning');
  final comment = CvField<String>('comment');
  final chapterId = CvField<int>('chapter_id');
  final entryId = CvField<int>('entry_id');
  final wordId = CvField<int>('word_id');
  final referenceId = CvField<int>('reference_id');
  final userId = CvField<int>('user_id');

  @override
  List<CvField> get fields =>
      [id, meaning, comment, chapterId, entryId, wordId, referenceId, userId];

  String get schema => '${meaning.key} ${referenceId.key}';
}
