import 'package:cv/cv.dart';
import 'package:dicionario_waiwai/models/base.dart';

String referenceColumn = 'reference';
String urlColumn = 'url';

class DbReference extends DbRecord {
  final reference = CvField<String>(referenceColumn);
  final url = CvField<String>(urlColumn);

  @override
  List<CvField> get fields => [id, reference, url];
}
