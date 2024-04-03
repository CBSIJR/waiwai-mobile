import 'package:cv/cv.dart';
import 'package:dicionario_waiwai/models/base.dart';

String fullnameColumn = 'full_name';

class DbUser extends DbRecord {
  final fullname = CvField<String>(fullnameColumn);

  @override
  List<CvField> get fields => [id, fullname];
}
