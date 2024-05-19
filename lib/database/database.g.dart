// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _authorsMeta =
      const VerificationMeta('authors');
  @override
  late final GeneratedColumn<String> authors = GeneratedColumn<String>(
      'authors', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, reference, year, authors, url];
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
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('authors')) {
      context.handle(_authorsMeta,
          authors.isAcceptableOrUnknown(data['authors']!, _authorsMeta));
    } else if (isInserting) {
      context.missing(_authorsMeta);
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
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
      authors: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}authors'])!,
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
  final int year;
  final String authors;
  final String? url;
  const Reference(
      {required this.id,
      required this.reference,
      required this.year,
      required this.authors,
      this.url});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['reference'] = Variable<String>(reference);
    map['year'] = Variable<int>(year);
    map['authors'] = Variable<String>(authors);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  ReferencesCompanion toCompanion(bool nullToAbsent) {
    return ReferencesCompanion(
      id: Value(id),
      reference: Value(reference),
      year: Value(year),
      authors: Value(authors),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory Reference.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reference(
      id: serializer.fromJson<int>(json['id']),
      reference: serializer.fromJson<String>(json['reference']),
      year: serializer.fromJson<int>(json['year']),
      authors: serializer.fromJson<String>(json['authors']),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reference': serializer.toJson<String>(reference),
      'year': serializer.toJson<int>(year),
      'authors': serializer.toJson<String>(authors),
      'url': serializer.toJson<String?>(url),
    };
  }

  Reference copyWith(
          {int? id,
          String? reference,
          int? year,
          String? authors,
          Value<String?> url = const Value.absent()}) =>
      Reference(
        id: id ?? this.id,
        reference: reference ?? this.reference,
        year: year ?? this.year,
        authors: authors ?? this.authors,
        url: url.present ? url.value : this.url,
      );
  @override
  String toString() {
    return (StringBuffer('Reference(')
          ..write('id: $id, ')
          ..write('reference: $reference, ')
          ..write('year: $year, ')
          ..write('authors: $authors, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reference, year, authors, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reference &&
          other.id == this.id &&
          other.reference == this.reference &&
          other.year == this.year &&
          other.authors == this.authors &&
          other.url == this.url);
}

class ReferencesCompanion extends UpdateCompanion<Reference> {
  final Value<int> id;
  final Value<String> reference;
  final Value<int> year;
  final Value<String> authors;
  final Value<String?> url;
  const ReferencesCompanion({
    this.id = const Value.absent(),
    this.reference = const Value.absent(),
    this.year = const Value.absent(),
    this.authors = const Value.absent(),
    this.url = const Value.absent(),
  });
  ReferencesCompanion.insert({
    this.id = const Value.absent(),
    required String reference,
    required int year,
    required String authors,
    this.url = const Value.absent(),
  })  : reference = Value(reference),
        year = Value(year),
        authors = Value(authors);
  static Insertable<Reference> custom({
    Expression<int>? id,
    Expression<String>? reference,
    Expression<int>? year,
    Expression<String>? authors,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reference != null) 'reference': reference,
      if (year != null) 'year': year,
      if (authors != null) 'authors': authors,
      if (url != null) 'url': url,
    });
  }

  ReferencesCompanion copyWith(
      {Value<int>? id,
      Value<String>? reference,
      Value<int>? year,
      Value<String>? authors,
      Value<String?>? url}) {
    return ReferencesCompanion(
      id: id ?? this.id,
      reference: reference ?? this.reference,
      year: year ?? this.year,
      authors: authors ?? this.authors,
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
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (authors.present) {
      map['authors'] = Variable<String>(authors.value);
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
          ..write('year: $year, ')
          ..write('authors: $authors, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, category, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String category;
  final String description;
  const Category(
      {required this.id, required this.category, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    map['description'] = Variable<String>(description);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      category: Value(category),
      description: Value(description),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
      'description': serializer.toJson<String>(description),
    };
  }

  Category copyWith({int? id, String? category, String? description}) =>
      Category(
        id: id ?? this.id,
        category: category ?? this.category,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.category == this.category &&
          other.description == this.description);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> category;
  final Value<String> description;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String category,
    required String description,
  })  : category = Value(category),
        description = Value(description);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id, Value<String>? category, Value<String>? description}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
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
      [id, word, phonemic, createdAt, updatedAt, userId];
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
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
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
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
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
  final DateTime updatedAt;
  final int userId;
  const Word(
      {required this.id,
      required this.word,
      this.phonemic,
      required this.createdAt,
      required this.updatedAt,
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
    map['updated_at'] = Variable<DateTime>(updatedAt);
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
      updatedAt: Value(updatedAt),
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
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
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
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Word copyWith(
          {int? id,
          String? word,
          Value<String?> phonemic = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? userId}) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        phonemic: phonemic.present ? phonemic.value : this.phonemic,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('phonemic: $phonemic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, word, phonemic, createdAt, updatedAt, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.word == this.word &&
          other.phonemic == this.phonemic &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.userId == this.userId);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<String> word;
  final Value<String?> phonemic;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> userId;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.phonemic = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.userId = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    this.phonemic = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required int userId,
  })  : word = Value(word),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        userId = Value(userId);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? phonemic,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (phonemic != null) 'phonemic': phonemic,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (userId != null) 'user_id': userId,
    });
  }

  WordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String?>? phonemic,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? userId}) {
    return WordsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      phonemic: phonemic ?? this.phonemic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('updatedAt: $updatedAt, ')
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
  static const VerificationMeta _meaningPtMeta =
      const VerificationMeta('meaningPt');
  @override
  late final GeneratedColumn<String> meaningPt = GeneratedColumn<String>(
      'meaning_pt', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _meaningWwMeta =
      const VerificationMeta('meaningWw');
  @override
  late final GeneratedColumn<String> meaningWw = GeneratedColumn<String>(
      'meaning_ww', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _commentPtMeta =
      const VerificationMeta('commentPt');
  @override
  late final GeneratedColumn<String> commentPt = GeneratedColumn<String>(
      'comment_pt', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _commentWwMeta =
      const VerificationMeta('commentWw');
  @override
  late final GeneratedColumn<String> commentWw = GeneratedColumn<String>(
      'comment_ww', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns => [
        id,
        meaningPt,
        meaningWw,
        commentPt,
        commentWw,
        createdAt,
        updatedAt,
        wordId,
        referenceId,
        userId
      ];
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
    if (data.containsKey('meaning_pt')) {
      context.handle(_meaningPtMeta,
          meaningPt.isAcceptableOrUnknown(data['meaning_pt']!, _meaningPtMeta));
    } else if (isInserting) {
      context.missing(_meaningPtMeta);
    }
    if (data.containsKey('meaning_ww')) {
      context.handle(_meaningWwMeta,
          meaningWw.isAcceptableOrUnknown(data['meaning_ww']!, _meaningWwMeta));
    }
    if (data.containsKey('comment_pt')) {
      context.handle(_commentPtMeta,
          commentPt.isAcceptableOrUnknown(data['comment_pt']!, _commentPtMeta));
    }
    if (data.containsKey('comment_ww')) {
      context.handle(_commentWwMeta,
          commentWw.isAcceptableOrUnknown(data['comment_ww']!, _commentWwMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
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
      meaningPt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning_pt'])!,
      meaningWw: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning_ww']),
      commentPt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment_pt']),
      commentWw: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment_ww']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
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
  final String meaningPt;
  final String? meaningWw;
  final String? commentPt;
  final String? commentWw;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int wordId;
  final int referenceId;
  final int userId;
  const Meaning(
      {required this.id,
      required this.meaningPt,
      this.meaningWw,
      this.commentPt,
      this.commentWw,
      required this.createdAt,
      required this.updatedAt,
      required this.wordId,
      required this.referenceId,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['meaning_pt'] = Variable<String>(meaningPt);
    if (!nullToAbsent || meaningWw != null) {
      map['meaning_ww'] = Variable<String>(meaningWw);
    }
    if (!nullToAbsent || commentPt != null) {
      map['comment_pt'] = Variable<String>(commentPt);
    }
    if (!nullToAbsent || commentWw != null) {
      map['comment_ww'] = Variable<String>(commentWw);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['word_id'] = Variable<int>(wordId);
    map['reference_id'] = Variable<int>(referenceId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  MeaningsCompanion toCompanion(bool nullToAbsent) {
    return MeaningsCompanion(
      id: Value(id),
      meaningPt: Value(meaningPt),
      meaningWw: meaningWw == null && nullToAbsent
          ? const Value.absent()
          : Value(meaningWw),
      commentPt: commentPt == null && nullToAbsent
          ? const Value.absent()
          : Value(commentPt),
      commentWw: commentWw == null && nullToAbsent
          ? const Value.absent()
          : Value(commentWw),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
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
      meaningPt: serializer.fromJson<String>(json['meaningPt']),
      meaningWw: serializer.fromJson<String?>(json['meaningWw']),
      commentPt: serializer.fromJson<String?>(json['commentPt']),
      commentWw: serializer.fromJson<String?>(json['commentWw']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
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
      'meaningPt': serializer.toJson<String>(meaningPt),
      'meaningWw': serializer.toJson<String?>(meaningWw),
      'commentPt': serializer.toJson<String?>(commentPt),
      'commentWw': serializer.toJson<String?>(commentWw),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'wordId': serializer.toJson<int>(wordId),
      'referenceId': serializer.toJson<int>(referenceId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Meaning copyWith(
          {int? id,
          String? meaningPt,
          Value<String?> meaningWw = const Value.absent(),
          Value<String?> commentPt = const Value.absent(),
          Value<String?> commentWw = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? wordId,
          int? referenceId,
          int? userId}) =>
      Meaning(
        id: id ?? this.id,
        meaningPt: meaningPt ?? this.meaningPt,
        meaningWw: meaningWw.present ? meaningWw.value : this.meaningWw,
        commentPt: commentPt.present ? commentPt.value : this.commentPt,
        commentWw: commentWw.present ? commentWw.value : this.commentWw,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        wordId: wordId ?? this.wordId,
        referenceId: referenceId ?? this.referenceId,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Meaning(')
          ..write('id: $id, ')
          ..write('meaningPt: $meaningPt, ')
          ..write('meaningWw: $meaningWw, ')
          ..write('commentPt: $commentPt, ')
          ..write('commentWw: $commentWw, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('wordId: $wordId, ')
          ..write('referenceId: $referenceId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, meaningPt, meaningWw, commentPt,
      commentWw, createdAt, updatedAt, wordId, referenceId, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meaning &&
          other.id == this.id &&
          other.meaningPt == this.meaningPt &&
          other.meaningWw == this.meaningWw &&
          other.commentPt == this.commentPt &&
          other.commentWw == this.commentWw &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.wordId == this.wordId &&
          other.referenceId == this.referenceId &&
          other.userId == this.userId);
}

class MeaningsCompanion extends UpdateCompanion<Meaning> {
  final Value<int> id;
  final Value<String> meaningPt;
  final Value<String?> meaningWw;
  final Value<String?> commentPt;
  final Value<String?> commentWw;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> wordId;
  final Value<int> referenceId;
  final Value<int> userId;
  const MeaningsCompanion({
    this.id = const Value.absent(),
    this.meaningPt = const Value.absent(),
    this.meaningWw = const Value.absent(),
    this.commentPt = const Value.absent(),
    this.commentWw = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.wordId = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  MeaningsCompanion.insert({
    this.id = const Value.absent(),
    required String meaningPt,
    this.meaningWw = const Value.absent(),
    this.commentPt = const Value.absent(),
    this.commentWw = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required int wordId,
    required int referenceId,
    required int userId,
  })  : meaningPt = Value(meaningPt),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        wordId = Value(wordId),
        referenceId = Value(referenceId),
        userId = Value(userId);
  static Insertable<Meaning> custom({
    Expression<int>? id,
    Expression<String>? meaningPt,
    Expression<String>? meaningWw,
    Expression<String>? commentPt,
    Expression<String>? commentWw,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? wordId,
    Expression<int>? referenceId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (meaningPt != null) 'meaning_pt': meaningPt,
      if (meaningWw != null) 'meaning_ww': meaningWw,
      if (commentPt != null) 'comment_pt': commentPt,
      if (commentWw != null) 'comment_ww': commentWw,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (wordId != null) 'word_id': wordId,
      if (referenceId != null) 'reference_id': referenceId,
      if (userId != null) 'user_id': userId,
    });
  }

  MeaningsCompanion copyWith(
      {Value<int>? id,
      Value<String>? meaningPt,
      Value<String?>? meaningWw,
      Value<String?>? commentPt,
      Value<String?>? commentWw,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? wordId,
      Value<int>? referenceId,
      Value<int>? userId}) {
    return MeaningsCompanion(
      id: id ?? this.id,
      meaningPt: meaningPt ?? this.meaningPt,
      meaningWw: meaningWw ?? this.meaningWw,
      commentPt: commentPt ?? this.commentPt,
      commentWw: commentWw ?? this.commentWw,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (meaningPt.present) {
      map['meaning_pt'] = Variable<String>(meaningPt.value);
    }
    if (meaningWw.present) {
      map['meaning_ww'] = Variable<String>(meaningWw.value);
    }
    if (commentPt.present) {
      map['comment_pt'] = Variable<String>(commentPt.value);
    }
    if (commentWw.present) {
      map['comment_ww'] = Variable<String>(commentWw.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('meaningPt: $meaningPt, ')
          ..write('meaningWw: $meaningWw, ')
          ..write('commentPt: $commentPt, ')
          ..write('commentWw: $commentWw, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('wordId: $wordId, ')
          ..write('referenceId: $referenceId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileDirMeta =
      const VerificationMeta('fileDir');
  @override
  late final GeneratedColumn<String> fileDir = GeneratedColumn<String>(
      'file_dir', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentTypeMeta =
      const VerificationMeta('contentType');
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
      'content_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _wordIdMeta = const VerificationMeta('wordId');
  @override
  late final GeneratedColumn<int> wordId = GeneratedColumn<int>(
      'word_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES words (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        fileName,
        fileDir,
        url,
        contentType,
        createdAt,
        updatedAt,
        wordId,
        userId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(Insertable<Attachment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_dir')) {
      context.handle(_fileDirMeta,
          fileDir.isAcceptableOrUnknown(data['file_dir']!, _fileDirMeta));
    } else if (isInserting) {
      context.missing(_fileDirMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('content_type')) {
      context.handle(
          _contentTypeMeta,
          contentType.isAcceptableOrUnknown(
              data['content_type']!, _contentTypeMeta));
    } else if (isInserting) {
      context.missing(_contentTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('word_id')) {
      context.handle(_wordIdMeta,
          wordId.isAcceptableOrUnknown(data['word_id']!, _wordIdMeta));
    } else if (isInserting) {
      context.missing(_wordIdMeta);
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
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      fileDir: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_dir'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      contentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      wordId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}word_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final int id;
  final String uuid;
  final String fileName;
  final String fileDir;
  final String url;
  final String contentType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int wordId;
  final int userId;
  const Attachment(
      {required this.id,
      required this.uuid,
      required this.fileName,
      required this.fileDir,
      required this.url,
      required this.contentType,
      required this.createdAt,
      required this.updatedAt,
      required this.wordId,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['file_name'] = Variable<String>(fileName);
    map['file_dir'] = Variable<String>(fileDir);
    map['url'] = Variable<String>(url);
    map['content_type'] = Variable<String>(contentType);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['word_id'] = Variable<int>(wordId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      fileName: Value(fileName),
      fileDir: Value(fileDir),
      url: Value(url),
      contentType: Value(contentType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      wordId: Value(wordId),
      userId: Value(userId),
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attachment(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      fileName: serializer.fromJson<String>(json['fileName']),
      fileDir: serializer.fromJson<String>(json['fileDir']),
      url: serializer.fromJson<String>(json['url']),
      contentType: serializer.fromJson<String>(json['contentType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      wordId: serializer.fromJson<int>(json['wordId']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'fileName': serializer.toJson<String>(fileName),
      'fileDir': serializer.toJson<String>(fileDir),
      'url': serializer.toJson<String>(url),
      'contentType': serializer.toJson<String>(contentType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'wordId': serializer.toJson<int>(wordId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Attachment copyWith(
          {int? id,
          String? uuid,
          String? fileName,
          String? fileDir,
          String? url,
          String? contentType,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? wordId,
          int? userId}) =>
      Attachment(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        fileName: fileName ?? this.fileName,
        fileDir: fileDir ?? this.fileDir,
        url: url ?? this.url,
        contentType: contentType ?? this.contentType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        wordId: wordId ?? this.wordId,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('fileName: $fileName, ')
          ..write('fileDir: $fileDir, ')
          ..write('url: $url, ')
          ..write('contentType: $contentType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('wordId: $wordId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, fileName, fileDir, url, contentType,
      createdAt, updatedAt, wordId, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.fileName == this.fileName &&
          other.fileDir == this.fileDir &&
          other.url == this.url &&
          other.contentType == this.contentType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.wordId == this.wordId &&
          other.userId == this.userId);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> fileName;
  final Value<String> fileDir;
  final Value<String> url;
  final Value<String> contentType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> wordId;
  final Value<int> userId;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.fileName = const Value.absent(),
    this.fileDir = const Value.absent(),
    this.url = const Value.absent(),
    this.contentType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.wordId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String fileName,
    required String fileDir,
    required String url,
    required String contentType,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int wordId,
    required int userId,
  })  : uuid = Value(uuid),
        fileName = Value(fileName),
        fileDir = Value(fileDir),
        url = Value(url),
        contentType = Value(contentType),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        wordId = Value(wordId),
        userId = Value(userId);
  static Insertable<Attachment> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? fileName,
    Expression<String>? fileDir,
    Expression<String>? url,
    Expression<String>? contentType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? wordId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (fileName != null) 'file_name': fileName,
      if (fileDir != null) 'file_dir': fileDir,
      if (url != null) 'url': url,
      if (contentType != null) 'content_type': contentType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (wordId != null) 'word_id': wordId,
      if (userId != null) 'user_id': userId,
    });
  }

  AttachmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? fileName,
      Value<String>? fileDir,
      Value<String>? url,
      Value<String>? contentType,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? wordId,
      Value<int>? userId}) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      fileName: fileName ?? this.fileName,
      fileDir: fileDir ?? this.fileDir,
      url: url ?? this.url,
      contentType: contentType ?? this.contentType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      wordId: wordId ?? this.wordId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (fileDir.present) {
      map['file_dir'] = Variable<String>(fileDir.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (wordId.present) {
      map['word_id'] = Variable<int>(wordId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('fileName: $fileName, ')
          ..write('fileDir: $fileDir, ')
          ..write('url: $url, ')
          ..write('contentType: $contentType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('wordId: $wordId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $WordCategoriesTable extends WordCategories
    with TableInfo<$WordCategoriesTable, WordCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _wordIdMeta = const VerificationMeta('wordId');
  @override
  late final GeneratedColumn<int> wordId = GeneratedColumn<int>(
      'word_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES words (id)'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  @override
  List<GeneratedColumn> get $columns => [wordId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_categories';
  @override
  VerificationContext validateIntegrity(Insertable<WordCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('word_id')) {
      context.handle(_wordIdMeta,
          wordId.isAcceptableOrUnknown(data['word_id']!, _wordIdMeta));
    } else if (isInserting) {
      context.missing(_wordIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  WordCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordCategory(
      wordId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}word_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  $WordCategoriesTable createAlias(String alias) {
    return $WordCategoriesTable(attachedDatabase, alias);
  }
}

class WordCategory extends DataClass implements Insertable<WordCategory> {
  final int wordId;
  final int categoryId;
  const WordCategory({required this.wordId, required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word_id'] = Variable<int>(wordId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  WordCategoriesCompanion toCompanion(bool nullToAbsent) {
    return WordCategoriesCompanion(
      wordId: Value(wordId),
      categoryId: Value(categoryId),
    );
  }

  factory WordCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordCategory(
      wordId: serializer.fromJson<int>(json['wordId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'wordId': serializer.toJson<int>(wordId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  WordCategory copyWith({int? wordId, int? categoryId}) => WordCategory(
        wordId: wordId ?? this.wordId,
        categoryId: categoryId ?? this.categoryId,
      );
  @override
  String toString() {
    return (StringBuffer('WordCategory(')
          ..write('wordId: $wordId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(wordId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordCategory &&
          other.wordId == this.wordId &&
          other.categoryId == this.categoryId);
}

class WordCategoriesCompanion extends UpdateCompanion<WordCategory> {
  final Value<int> wordId;
  final Value<int> categoryId;
  final Value<int> rowid;
  const WordCategoriesCompanion({
    this.wordId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordCategoriesCompanion.insert({
    required int wordId,
    required int categoryId,
    this.rowid = const Value.absent(),
  })  : wordId = Value(wordId),
        categoryId = Value(categoryId);
  static Insertable<WordCategory> custom({
    Expression<int>? wordId,
    Expression<int>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (wordId != null) 'word_id': wordId,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordCategoriesCompanion copyWith(
      {Value<int>? wordId, Value<int>? categoryId, Value<int>? rowid}) {
    return WordCategoriesCompanion(
      wordId: wordId ?? this.wordId,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (wordId.present) {
      map['word_id'] = Variable<int>(wordId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordCategoriesCompanion(')
          ..write('wordId: $wordId, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ReferencesTable references = $ReferencesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $WordsTable words = $WordsTable(this);
  late final $MeaningsTable meanings = $MeaningsTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $WordCategoriesTable wordCategories = $WordCategoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        references,
        categories,
        users,
        words,
        meanings,
        attachments,
        wordCategories
      ];
}

typedef $$ReferencesTableInsertCompanionBuilder = ReferencesCompanion Function({
  Value<int> id,
  required String reference,
  required int year,
  required String authors,
  Value<String?> url,
});
typedef $$ReferencesTableUpdateCompanionBuilder = ReferencesCompanion Function({
  Value<int> id,
  Value<String> reference,
  Value<int> year,
  Value<String> authors,
  Value<String?> url,
});

class $$ReferencesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReferencesTable,
    Reference,
    $$ReferencesTableFilterComposer,
    $$ReferencesTableOrderingComposer,
    $$ReferencesTableProcessedTableManager,
    $$ReferencesTableInsertCompanionBuilder,
    $$ReferencesTableUpdateCompanionBuilder> {
  $$ReferencesTableTableManager(_$AppDatabase db, $ReferencesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ReferencesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ReferencesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ReferencesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> reference = const Value.absent(),
            Value<int> year = const Value.absent(),
            Value<String> authors = const Value.absent(),
            Value<String?> url = const Value.absent(),
          }) =>
              ReferencesCompanion(
            id: id,
            reference: reference,
            year: year,
            authors: authors,
            url: url,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String reference,
            required int year,
            required String authors,
            Value<String?> url = const Value.absent(),
          }) =>
              ReferencesCompanion.insert(
            id: id,
            reference: reference,
            year: year,
            authors: authors,
            url: url,
          ),
        ));
}

class $$ReferencesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ReferencesTable,
    Reference,
    $$ReferencesTableFilterComposer,
    $$ReferencesTableOrderingComposer,
    $$ReferencesTableProcessedTableManager,
    $$ReferencesTableInsertCompanionBuilder,
    $$ReferencesTableUpdateCompanionBuilder> {
  $$ReferencesTableProcessedTableManager(super.$state);
}

class $$ReferencesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ReferencesTable> {
  $$ReferencesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get reference => $state.composableBuilder(
      column: $state.table.reference,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get year => $state.composableBuilder(
      column: $state.table.year,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get authors => $state.composableBuilder(
      column: $state.table.authors,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter meaningsRefs(
      ComposableFilter Function($$MeaningsTableFilterComposer f) f) {
    final $$MeaningsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.meanings,
        getReferencedColumn: (t) => t.referenceId,
        builder: (joinBuilder, parentComposers) =>
            $$MeaningsTableFilterComposer(ComposerState(
                $state.db, $state.db.meanings, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ReferencesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ReferencesTable> {
  $$ReferencesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get reference => $state.composableBuilder(
      column: $state.table.reference,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get year => $state.composableBuilder(
      column: $state.table.year,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get authors => $state.composableBuilder(
      column: $state.table.authors,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CategoriesTableInsertCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String category,
  required String description,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> category,
  Value<String> description,
});

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableProcessedTableManager,
    $$CategoriesTableInsertCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoriesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CategoriesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            category: category,
            description: description,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String category,
            required String description,
          }) =>
              CategoriesCompanion.insert(
            id: id,
            category: category,
            description: description,
          ),
        ));
}

class $$CategoriesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableProcessedTableManager,
    $$CategoriesTableInsertCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder> {
  $$CategoriesTableProcessedTableManager(super.$state);
}

class $$CategoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter wordCategoriesRefs(
      ComposableFilter Function($$WordCategoriesTableFilterComposer f) f) {
    final $$WordCategoriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.wordCategories,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) =>
            $$WordCategoriesTableFilterComposer(ComposerState($state.db,
                $state.db.wordCategories, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UsersTableInsertCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String fullName,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> fullName,
});

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableProcessedTableManager,
    $$UsersTableInsertCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$UsersTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> fullName = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            fullName: fullName,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String fullName,
          }) =>
              UsersCompanion.insert(
            id: id,
            fullName: fullName,
          ),
        ));
}

class $$UsersTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableProcessedTableManager,
    $$UsersTableInsertCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder> {
  $$UsersTableProcessedTableManager(super.$state);
}

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fullName => $state.composableBuilder(
      column: $state.table.fullName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter wordsRefs(
      ComposableFilter Function($$WordsTableFilterComposer f) f) {
    final $$WordsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.words,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) => $$WordsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.words, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter meaningsRefs(
      ComposableFilter Function($$MeaningsTableFilterComposer f) f) {
    final $$MeaningsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.meanings,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$MeaningsTableFilterComposer(ComposerState(
                $state.db, $state.db.meanings, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter attachmentsRefs(
      ComposableFilter Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.attachments,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$AttachmentsTableFilterComposer(ComposerState($state.db,
                $state.db.attachments, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fullName => $state.composableBuilder(
      column: $state.table.fullName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$WordsTableInsertCompanionBuilder = WordsCompanion Function({
  Value<int> id,
  required String word,
  Value<String?> phonemic,
  required DateTime createdAt,
  required DateTime updatedAt,
  required int userId,
});
typedef $$WordsTableUpdateCompanionBuilder = WordsCompanion Function({
  Value<int> id,
  Value<String> word,
  Value<String?> phonemic,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> userId,
});

class $$WordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WordsTable,
    Word,
    $$WordsTableFilterComposer,
    $$WordsTableOrderingComposer,
    $$WordsTableProcessedTableManager,
    $$WordsTableInsertCompanionBuilder,
    $$WordsTableUpdateCompanionBuilder> {
  $$WordsTableTableManager(_$AppDatabase db, $WordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WordsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WordsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$WordsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> word = const Value.absent(),
            Value<String?> phonemic = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> userId = const Value.absent(),
          }) =>
              WordsCompanion(
            id: id,
            word: word,
            phonemic: phonemic,
            createdAt: createdAt,
            updatedAt: updatedAt,
            userId: userId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String word,
            Value<String?> phonemic = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            required int userId,
          }) =>
              WordsCompanion.insert(
            id: id,
            word: word,
            phonemic: phonemic,
            createdAt: createdAt,
            updatedAt: updatedAt,
            userId: userId,
          ),
        ));
}

class $$WordsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $WordsTable,
    Word,
    $$WordsTableFilterComposer,
    $$WordsTableOrderingComposer,
    $$WordsTableProcessedTableManager,
    $$WordsTableInsertCompanionBuilder,
    $$WordsTableUpdateCompanionBuilder> {
  $$WordsTableProcessedTableManager(super.$state);
}

class $$WordsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WordsTable> {
  $$WordsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get phonemic => $state.composableBuilder(
      column: $state.table.phonemic,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter meaningsRefs(
      ComposableFilter Function($$MeaningsTableFilterComposer f) f) {
    final $$MeaningsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.meanings,
        getReferencedColumn: (t) => t.wordId,
        builder: (joinBuilder, parentComposers) =>
            $$MeaningsTableFilterComposer(ComposerState(
                $state.db, $state.db.meanings, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter attachmentsRefs(
      ComposableFilter Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.attachments,
        getReferencedColumn: (t) => t.wordId,
        builder: (joinBuilder, parentComposers) =>
            $$AttachmentsTableFilterComposer(ComposerState($state.db,
                $state.db.attachments, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter wordCategoriesRefs(
      ComposableFilter Function($$WordCategoriesTableFilterComposer f) f) {
    final $$WordCategoriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.wordCategories,
        getReferencedColumn: (t) => t.wordId,
        builder: (joinBuilder, parentComposers) =>
            $$WordCategoriesTableFilterComposer(ComposerState($state.db,
                $state.db.wordCategories, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$WordsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WordsTable> {
  $$WordsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get phonemic => $state.composableBuilder(
      column: $state.table.phonemic,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$MeaningsTableInsertCompanionBuilder = MeaningsCompanion Function({
  Value<int> id,
  required String meaningPt,
  Value<String?> meaningWw,
  Value<String?> commentPt,
  Value<String?> commentWw,
  required DateTime createdAt,
  required DateTime updatedAt,
  required int wordId,
  required int referenceId,
  required int userId,
});
typedef $$MeaningsTableUpdateCompanionBuilder = MeaningsCompanion Function({
  Value<int> id,
  Value<String> meaningPt,
  Value<String?> meaningWw,
  Value<String?> commentPt,
  Value<String?> commentWw,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> wordId,
  Value<int> referenceId,
  Value<int> userId,
});

class $$MeaningsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MeaningsTable,
    Meaning,
    $$MeaningsTableFilterComposer,
    $$MeaningsTableOrderingComposer,
    $$MeaningsTableProcessedTableManager,
    $$MeaningsTableInsertCompanionBuilder,
    $$MeaningsTableUpdateCompanionBuilder> {
  $$MeaningsTableTableManager(_$AppDatabase db, $MeaningsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MeaningsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MeaningsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MeaningsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> meaningPt = const Value.absent(),
            Value<String?> meaningWw = const Value.absent(),
            Value<String?> commentPt = const Value.absent(),
            Value<String?> commentWw = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> wordId = const Value.absent(),
            Value<int> referenceId = const Value.absent(),
            Value<int> userId = const Value.absent(),
          }) =>
              MeaningsCompanion(
            id: id,
            meaningPt: meaningPt,
            meaningWw: meaningWw,
            commentPt: commentPt,
            commentWw: commentWw,
            createdAt: createdAt,
            updatedAt: updatedAt,
            wordId: wordId,
            referenceId: referenceId,
            userId: userId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String meaningPt,
            Value<String?> meaningWw = const Value.absent(),
            Value<String?> commentPt = const Value.absent(),
            Value<String?> commentWw = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            required int wordId,
            required int referenceId,
            required int userId,
          }) =>
              MeaningsCompanion.insert(
            id: id,
            meaningPt: meaningPt,
            meaningWw: meaningWw,
            commentPt: commentPt,
            commentWw: commentWw,
            createdAt: createdAt,
            updatedAt: updatedAt,
            wordId: wordId,
            referenceId: referenceId,
            userId: userId,
          ),
        ));
}

class $$MeaningsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $MeaningsTable,
    Meaning,
    $$MeaningsTableFilterComposer,
    $$MeaningsTableOrderingComposer,
    $$MeaningsTableProcessedTableManager,
    $$MeaningsTableInsertCompanionBuilder,
    $$MeaningsTableUpdateCompanionBuilder> {
  $$MeaningsTableProcessedTableManager(super.$state);
}

class $$MeaningsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MeaningsTable> {
  $$MeaningsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get meaningPt => $state.composableBuilder(
      column: $state.table.meaningPt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get meaningWw => $state.composableBuilder(
      column: $state.table.meaningWw,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get commentPt => $state.composableBuilder(
      column: $state.table.commentPt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get commentWw => $state.composableBuilder(
      column: $state.table.commentWw,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$WordsTableFilterComposer get wordId {
    final $$WordsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wordId,
        referencedTable: $state.db.words,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WordsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.words, joinBuilder, parentComposers)));
    return composer;
  }

  $$ReferencesTableFilterComposer get referenceId {
    final $$ReferencesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.referenceId,
        referencedTable: $state.db.references,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ReferencesTableFilterComposer(ComposerState($state.db,
                $state.db.references, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$MeaningsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MeaningsTable> {
  $$MeaningsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get meaningPt => $state.composableBuilder(
      column: $state.table.meaningPt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get meaningWw => $state.composableBuilder(
      column: $state.table.meaningWw,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get commentPt => $state.composableBuilder(
      column: $state.table.commentPt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get commentWw => $state.composableBuilder(
      column: $state.table.commentWw,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$WordsTableOrderingComposer get wordId {
    final $$WordsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wordId,
        referencedTable: $state.db.words,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WordsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.words, joinBuilder, parentComposers)));
    return composer;
  }

  $$ReferencesTableOrderingComposer get referenceId {
    final $$ReferencesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.referenceId,
        referencedTable: $state.db.references,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ReferencesTableOrderingComposer(ComposerState($state.db,
                $state.db.references, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$AttachmentsTableInsertCompanionBuilder = AttachmentsCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String fileName,
  required String fileDir,
  required String url,
  required String contentType,
  required DateTime createdAt,
  required DateTime updatedAt,
  required int wordId,
  required int userId,
});
typedef $$AttachmentsTableUpdateCompanionBuilder = AttachmentsCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> fileName,
  Value<String> fileDir,
  Value<String> url,
  Value<String> contentType,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> wordId,
  Value<int> userId,
});

class $$AttachmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttachmentsTable,
    Attachment,
    $$AttachmentsTableFilterComposer,
    $$AttachmentsTableOrderingComposer,
    $$AttachmentsTableProcessedTableManager,
    $$AttachmentsTableInsertCompanionBuilder,
    $$AttachmentsTableUpdateCompanionBuilder> {
  $$AttachmentsTableTableManager(_$AppDatabase db, $AttachmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AttachmentsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AttachmentsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$AttachmentsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> fileName = const Value.absent(),
            Value<String> fileDir = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> contentType = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> wordId = const Value.absent(),
            Value<int> userId = const Value.absent(),
          }) =>
              AttachmentsCompanion(
            id: id,
            uuid: uuid,
            fileName: fileName,
            fileDir: fileDir,
            url: url,
            contentType: contentType,
            createdAt: createdAt,
            updatedAt: updatedAt,
            wordId: wordId,
            userId: userId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String fileName,
            required String fileDir,
            required String url,
            required String contentType,
            required DateTime createdAt,
            required DateTime updatedAt,
            required int wordId,
            required int userId,
          }) =>
              AttachmentsCompanion.insert(
            id: id,
            uuid: uuid,
            fileName: fileName,
            fileDir: fileDir,
            url: url,
            contentType: contentType,
            createdAt: createdAt,
            updatedAt: updatedAt,
            wordId: wordId,
            userId: userId,
          ),
        ));
}

class $$AttachmentsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $AttachmentsTable,
    Attachment,
    $$AttachmentsTableFilterComposer,
    $$AttachmentsTableOrderingComposer,
    $$AttachmentsTableProcessedTableManager,
    $$AttachmentsTableInsertCompanionBuilder,
    $$AttachmentsTableUpdateCompanionBuilder> {
  $$AttachmentsTableProcessedTableManager(super.$state);
}

class $$AttachmentsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fileName => $state.composableBuilder(
      column: $state.table.fileName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fileDir => $state.composableBuilder(
      column: $state.table.fileDir,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get contentType => $state.composableBuilder(
      column: $state.table.contentType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$WordsTableFilterComposer get wordId {
    final $$WordsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wordId,
        referencedTable: $state.db.words,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WordsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.words, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AttachmentsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fileName => $state.composableBuilder(
      column: $state.table.fileName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fileDir => $state.composableBuilder(
      column: $state.table.fileDir,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get contentType => $state.composableBuilder(
      column: $state.table.contentType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$WordsTableOrderingComposer get wordId {
    final $$WordsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wordId,
        referencedTable: $state.db.words,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WordsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.words, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$WordCategoriesTableInsertCompanionBuilder = WordCategoriesCompanion
    Function({
  required int wordId,
  required int categoryId,
  Value<int> rowid,
});
typedef $$WordCategoriesTableUpdateCompanionBuilder = WordCategoriesCompanion
    Function({
  Value<int> wordId,
  Value<int> categoryId,
  Value<int> rowid,
});

class $$WordCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WordCategoriesTable,
    WordCategory,
    $$WordCategoriesTableFilterComposer,
    $$WordCategoriesTableOrderingComposer,
    $$WordCategoriesTableProcessedTableManager,
    $$WordCategoriesTableInsertCompanionBuilder,
    $$WordCategoriesTableUpdateCompanionBuilder> {
  $$WordCategoriesTableTableManager(
      _$AppDatabase db, $WordCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WordCategoriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WordCategoriesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$WordCategoriesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> wordId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WordCategoriesCompanion(
            wordId: wordId,
            categoryId: categoryId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int wordId,
            required int categoryId,
            Value<int> rowid = const Value.absent(),
          }) =>
              WordCategoriesCompanion.insert(
            wordId: wordId,
            categoryId: categoryId,
            rowid: rowid,
          ),
        ));
}

class $$WordCategoriesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $WordCategoriesTable,
    WordCategory,
    $$WordCategoriesTableFilterComposer,
    $$WordCategoriesTableOrderingComposer,
    $$WordCategoriesTableProcessedTableManager,
    $$WordCategoriesTableInsertCompanionBuilder,
    $$WordCategoriesTableUpdateCompanionBuilder> {
  $$WordCategoriesTableProcessedTableManager(super.$state);
}

class $$WordCategoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WordCategoriesTable> {
  $$WordCategoriesTableFilterComposer(super.$state);
  $$WordsTableFilterComposer get wordId {
    final $$WordsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wordId,
        referencedTable: $state.db.words,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WordsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.words, joinBuilder, parentComposers)));
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoriesTableFilterComposer(ComposerState($state.db,
                $state.db.categories, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$WordCategoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WordCategoriesTable> {
  $$WordCategoriesTableOrderingComposer(super.$state);
  $$WordsTableOrderingComposer get wordId {
    final $$WordsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wordId,
        referencedTable: $state.db.words,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WordsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.words, joinBuilder, parentComposers)));
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoriesTableOrderingComposer(ComposerState($state.db,
                $state.db.categories, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$ReferencesTableTableManager get references =>
      $$ReferencesTableTableManager(_db, _db.references);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
  $$MeaningsTableTableManager get meanings =>
      $$MeaningsTableTableManager(_db, _db.meanings);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
  $$WordCategoriesTableTableManager get wordCategories =>
      $$WordCategoriesTableTableManager(_db, _db.wordCategories);
}
