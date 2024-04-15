// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, fullName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String fullName;
  const User({required this.id, required this.fullName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      fullName: Value(fullName),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
    };
  }

  User copyWith({int? id, String? fullName}) => User(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('fullName: $fullName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fullName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User && other.id == this.id && other.fullName == this.fullName);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> fullName;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
  }) : fullName = Value(fullName);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? fullName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
    });
  }

  UsersCompanion copyWith({Value<int>? id, Value<String>? fullName}) {
    return UsersCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName')
          ..write(')'))
        .toString();
  }
}

class $ReferencesTable extends References
    with TableInfo<$ReferencesTable, Reference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _referenceMeta =
      const VerificationMeta('reference');
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
      'reference', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, reference, url];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'references';
  @override
  VerificationContext validateIntegrity(Insertable<Reference> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('reference')) {
      context.handle(_referenceMeta,
          reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta));
    } else if (isInserting) {
      context.missing(_referenceMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reference(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      reference: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
    );
  }

  @override
  $ReferencesTable createAlias(String alias) {
    return $ReferencesTable(attachedDatabase, alias);
  }
}

class Reference extends DataClass implements Insertable<Reference> {
  final int id;
  final String reference;
  final String? url;
  const Reference({required this.id, required this.reference, this.url});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['reference'] = Variable<String>(reference);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  ReferencesCompanion toCompanion(bool nullToAbsent) {
    return ReferencesCompanion(
      id: Value(id),
      reference: Value(reference),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory Reference.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reference(
      id: serializer.fromJson<int>(json['id']),
      reference: serializer.fromJson<String>(json['reference']),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reference': serializer.toJson<String>(reference),
      'url': serializer.toJson<String?>(url),
    };
  }

  Reference copyWith(
          {int? id,
          String? reference,
          Value<String?> url = const Value.absent()}) =>
      Reference(
        id: id ?? this.id,
        reference: reference ?? this.reference,
        url: url.present ? url.value : this.url,
      );
  @override
  String toString() {
    return (StringBuffer('Reference(')
          ..write('id: $id, ')
          ..write('reference: $reference, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reference, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reference &&
          other.id == this.id &&
          other.reference == this.reference &&
          other.url == this.url);
}

class ReferencesCompanion extends UpdateCompanion<Reference> {
  final Value<int> id;
  final Value<String> reference;
  final Value<String?> url;
  const ReferencesCompanion({
    this.id = const Value.absent(),
    this.reference = const Value.absent(),
    this.url = const Value.absent(),
  });
  ReferencesCompanion.insert({
    this.id = const Value.absent(),
    required String reference,
    this.url = const Value.absent(),
  }) : reference = Value(reference);
  static Insertable<Reference> custom({
    Expression<int>? id,
    Expression<String>? reference,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reference != null) 'reference': reference,
      if (url != null) 'url': url,
    });
  }

  ReferencesCompanion copyWith(
      {Value<int>? id, Value<String>? reference, Value<String?>? url}) {
    return ReferencesCompanion(
      id: id ?? this.id,
      reference: reference ?? this.reference,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReferencesCompanion(')
          ..write('id: $id, ')
          ..write('reference: $reference, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phonemicMeta =
      const VerificationMeta('phonemic');
  @override
  late final GeneratedColumn<String> phonemic = GeneratedColumn<String>(
      'phonemic', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateAtMeta =
      const VerificationMeta('updateAt');
  @override
  late final GeneratedColumn<DateTime> updateAt = GeneratedColumn<DateTime>(
      'update_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, word, phonemic, createdAt, updateAt, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('phonemic')) {
      context.handle(_phonemicMeta,
          phonemic.isAcceptableOrUnknown(data['phonemic']!, _phonemicMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      phonemic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phonemic']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updateAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_at'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int id;
  final String word;
  final String? phonemic;
  final DateTime createdAt;
  final DateTime updateAt;
  final int userId;
  const Word(
      {required this.id,
      required this.word,
      this.phonemic,
      required this.createdAt,
      required this.updateAt,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    if (!nullToAbsent || phonemic != null) {
      map['phonemic'] = Variable<String>(phonemic);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['update_at'] = Variable<DateTime>(updateAt);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      word: Value(word),
      phonemic: phonemic == null && nullToAbsent
          ? const Value.absent()
          : Value(phonemic),
      createdAt: Value(createdAt),
      updateAt: Value(updateAt),
      userId: Value(userId),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      phonemic: serializer.fromJson<String?>(json['phonemic']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'phonemic': serializer.toJson<String?>(phonemic),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updateAt': serializer.toJson<DateTime>(updateAt),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Word copyWith(
          {int? id,
          String? word,
          Value<String?> phonemic = const Value.absent(),
          DateTime? createdAt,
          DateTime? updateAt,
          int? userId}) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        phonemic: phonemic.present ? phonemic.value : this.phonemic,
        createdAt: createdAt ?? this.createdAt,
        updateAt: updateAt ?? this.updateAt,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('phonemic: $phonemic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, word, phonemic, createdAt, updateAt, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.word == this.word &&
          other.phonemic == this.phonemic &&
          other.createdAt == this.createdAt &&
          other.updateAt == this.updateAt &&
          other.userId == this.userId);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<String> word;
  final Value<String?> phonemic;
  final Value<DateTime> createdAt;
  final Value<DateTime> updateAt;
  final Value<int> userId;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.phonemic = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updateAt = const Value.absent(),
    this.userId = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    this.phonemic = const Value.absent(),
    required DateTime createdAt,
    required DateTime updateAt,
    required int userId,
  })  : word = Value(word),
        createdAt = Value(createdAt),
        updateAt = Value(updateAt),
        userId = Value(userId);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? phonemic,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updateAt,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (phonemic != null) 'phonemic': phonemic,
      if (createdAt != null) 'created_at': createdAt,
      if (updateAt != null) 'update_at': updateAt,
      if (userId != null) 'user_id': userId,
    });
  }

  WordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String?>? phonemic,
      Value<DateTime>? createdAt,
      Value<DateTime>? updateAt,
      Value<int>? userId}) {
    return WordsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      phonemic: phonemic ?? this.phonemic,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (phonemic.present) {
      map['phonemic'] = Variable<String>(phonemic.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('phonemic: $phonemic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $MeaningsTable extends Meanings with TableInfo<$MeaningsTable, Meaning> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeaningsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _meaningMeta =
      const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
      'meaning', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapter_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _entryIdMeta =
      const VerificationMeta('entryId');
  @override
  late final GeneratedColumn<int> entryId = GeneratedColumn<int>(
      'entry_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _wordIdMeta = const VerificationMeta('wordId');
  @override
  late final GeneratedColumn<int> wordId = GeneratedColumn<int>(
      'word_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES words (id)'));
  static const VerificationMeta _referenceIdMeta =
      const VerificationMeta('referenceId');
  @override
  late final GeneratedColumn<int> referenceId = GeneratedColumn<int>(
      'reference_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "references" (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, meaning, comment, chapterId, entryId, wordId, referenceId, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meanings';
  @override
  VerificationContext validateIntegrity(Insertable<Meaning> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    }
    if (data.containsKey('entry_id')) {
      context.handle(_entryIdMeta,
          entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta));
    }
    if (data.containsKey('word_id')) {
      context.handle(_wordIdMeta,
          wordId.isAcceptableOrUnknown(data['word_id']!, _wordIdMeta));
    } else if (isInserting) {
      context.missing(_wordIdMeta);
    }
    if (data.containsKey('reference_id')) {
      context.handle(
          _referenceIdMeta,
          referenceId.isAcceptableOrUnknown(
              data['reference_id']!, _referenceIdMeta));
    } else if (isInserting) {
      context.missing(_referenceIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meaning map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meaning(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      meaning: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
      chapterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_id']),
      entryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entry_id']),
      wordId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}word_id'])!,
      referenceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reference_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $MeaningsTable createAlias(String alias) {
    return $MeaningsTable(attachedDatabase, alias);
  }
}

class Meaning extends DataClass implements Insertable<Meaning> {
  final int id;
  final String meaning;
  final String? comment;
  final int? chapterId;
  final int? entryId;
  final int wordId;
  final int referenceId;
  final int userId;
  const Meaning(
      {required this.id,
      required this.meaning,
      this.comment,
      this.chapterId,
      this.entryId,
      required this.wordId,
      required this.referenceId,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['meaning'] = Variable<String>(meaning);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    if (!nullToAbsent || chapterId != null) {
      map['chapter_id'] = Variable<int>(chapterId);
    }
    if (!nullToAbsent || entryId != null) {
      map['entry_id'] = Variable<int>(entryId);
    }
    map['word_id'] = Variable<int>(wordId);
    map['reference_id'] = Variable<int>(referenceId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  MeaningsCompanion toCompanion(bool nullToAbsent) {
    return MeaningsCompanion(
      id: Value(id),
      meaning: Value(meaning),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      chapterId: chapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterId),
      entryId: entryId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryId),
      wordId: Value(wordId),
      referenceId: Value(referenceId),
      userId: Value(userId),
    );
  }

  factory Meaning.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meaning(
      id: serializer.fromJson<int>(json['id']),
      meaning: serializer.fromJson<String>(json['meaning']),
      comment: serializer.fromJson<String?>(json['comment']),
      chapterId: serializer.fromJson<int?>(json['chapterId']),
      entryId: serializer.fromJson<int?>(json['entryId']),
      wordId: serializer.fromJson<int>(json['wordId']),
      referenceId: serializer.fromJson<int>(json['referenceId']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'meaning': serializer.toJson<String>(meaning),
      'comment': serializer.toJson<String?>(comment),
      'chapterId': serializer.toJson<int?>(chapterId),
      'entryId': serializer.toJson<int?>(entryId),
      'wordId': serializer.toJson<int>(wordId),
      'referenceId': serializer.toJson<int>(referenceId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Meaning copyWith(
          {int? id,
          String? meaning,
          Value<String?> comment = const Value.absent(),
          Value<int?> chapterId = const Value.absent(),
          Value<int?> entryId = const Value.absent(),
          int? wordId,
          int? referenceId,
          int? userId}) =>
      Meaning(
        id: id ?? this.id,
        meaning: meaning ?? this.meaning,
        comment: comment.present ? comment.value : this.comment,
        chapterId: chapterId.present ? chapterId.value : this.chapterId,
        entryId: entryId.present ? entryId.value : this.entryId,
        wordId: wordId ?? this.wordId,
        referenceId: referenceId ?? this.referenceId,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Meaning(')
          ..write('id: $id, ')
          ..write('meaning: $meaning, ')
          ..write('comment: $comment, ')
          ..write('chapterId: $chapterId, ')
          ..write('entryId: $entryId, ')
          ..write('wordId: $wordId, ')
          ..write('referenceId: $referenceId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, meaning, comment, chapterId, entryId, wordId, referenceId, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meaning &&
          other.id == this.id &&
          other.meaning == this.meaning &&
          other.comment == this.comment &&
          other.chapterId == this.chapterId &&
          other.entryId == this.entryId &&
          other.wordId == this.wordId &&
          other.referenceId == this.referenceId &&
          other.userId == this.userId);
}

class MeaningsCompanion extends UpdateCompanion<Meaning> {
  final Value<int> id;
  final Value<String> meaning;
  final Value<String?> comment;
  final Value<int?> chapterId;
  final Value<int?> entryId;
  final Value<int> wordId;
  final Value<int> referenceId;
  final Value<int> userId;
  const MeaningsCompanion({
    this.id = const Value.absent(),
    this.meaning = const Value.absent(),
    this.comment = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.entryId = const Value.absent(),
    this.wordId = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  MeaningsCompanion.insert({
    this.id = const Value.absent(),
    required String meaning,
    this.comment = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.entryId = const Value.absent(),
    required int wordId,
    required int referenceId,
    required int userId,
  })  : meaning = Value(meaning),
        wordId = Value(wordId),
        referenceId = Value(referenceId),
        userId = Value(userId);
  static Insertable<Meaning> custom({
    Expression<int>? id,
    Expression<String>? meaning,
    Expression<String>? comment,
    Expression<int>? chapterId,
    Expression<int>? entryId,
    Expression<int>? wordId,
    Expression<int>? referenceId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (meaning != null) 'meaning': meaning,
      if (comment != null) 'comment': comment,
      if (chapterId != null) 'chapter_id': chapterId,
      if (entryId != null) 'entry_id': entryId,
      if (wordId != null) 'word_id': wordId,
      if (referenceId != null) 'reference_id': referenceId,
      if (userId != null) 'user_id': userId,
    });
  }

  MeaningsCompanion copyWith(
      {Value<int>? id,
      Value<String>? meaning,
      Value<String?>? comment,
      Value<int?>? chapterId,
      Value<int?>? entryId,
      Value<int>? wordId,
      Value<int>? referenceId,
      Value<int>? userId}) {
    return MeaningsCompanion(
      id: id ?? this.id,
      meaning: meaning ?? this.meaning,
      comment: comment ?? this.comment,
      chapterId: chapterId ?? this.chapterId,
      entryId: entryId ?? this.entryId,
      wordId: wordId ?? this.wordId,
      referenceId: referenceId ?? this.referenceId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<int>(chapterId.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (wordId.present) {
      map['word_id'] = Variable<int>(wordId.value);
    }
    if (referenceId.present) {
      map['reference_id'] = Variable<int>(referenceId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeaningsCompanion(')
          ..write('id: $id, ')
          ..write('meaning: $meaning, ')
          ..write('comment: $comment, ')
          ..write('chapterId: $chapterId, ')
          ..write('entryId: $entryId, ')
          ..write('wordId: $wordId, ')
          ..write('referenceId: $referenceId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $ReferencesTable references = $ReferencesTable(this);
  late final $WordsTable words = $WordsTable(this);
  late final $MeaningsTable meanings = $MeaningsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, references, words, meanings];
}
