// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
      'avatar', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, email, password, gender, age, avatar];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      avatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar'])!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String name;
  final String email;
  final String password;
  final String gender;
  final int age;
  final String avatar;
  const UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.gender,
      required this.age,
      required this.avatar});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['gender'] = Variable<String>(gender);
    map['age'] = Variable<int>(age);
    map['avatar'] = Variable<String>(avatar);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      password: Value(password),
      gender: Value(gender),
      age: Value(age),
      avatar: Value(avatar),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      gender: serializer.fromJson<String>(json['gender']),
      age: serializer.fromJson<int>(json['age']),
      avatar: serializer.fromJson<String>(json['avatar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'gender': serializer.toJson<String>(gender),
      'age': serializer.toJson<int>(age),
      'avatar': serializer.toJson<String>(avatar),
    };
  }

  UserData copyWith(
          {int? id,
          String? name,
          String? email,
          String? password,
          String? gender,
          int? age,
          String? avatar}) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        avatar: avatar ?? this.avatar,
      );
  UserData copyWithCompanion(UserCompanion data) {
    return UserData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      gender: data.gender.present ? data.gender.value : this.gender,
      age: data.age.present ? data.age.value : this.age,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, email, password, gender, age, avatar);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.password == this.password &&
          other.gender == this.gender &&
          other.age == this.age &&
          other.avatar == this.avatar);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> password;
  final Value<String> gender;
  final Value<int> age;
  final Value<String> avatar;
  const UserCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.gender = const Value.absent(),
    this.age = const Value.absent(),
    this.avatar = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String password,
    required String gender,
    required int age,
    required String avatar,
  })  : name = Value(name),
        email = Value(email),
        password = Value(password),
        gender = Value(gender),
        age = Value(age),
        avatar = Value(avatar);
  static Insertable<UserData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? gender,
    Expression<int>? age,
    Expression<String>? avatar,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (gender != null) 'gender': gender,
      if (age != null) 'age': age,
      if (avatar != null) 'avatar': avatar,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? password,
      Value<String>? gender,
      Value<int>? age,
      Value<String>? avatar}) {
    return UserCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }
}

class $MoodTrackTable extends MoodTrack
    with TableInfo<$MoodTrackTable, MoodTrackData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoodTrackTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageMoodMeta =
      const VerificationMeta('imageMood');
  @override
  late final GeneratedColumn<String> imageMood = GeneratedColumn<String>(
      'image_mood', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordMoodMeta =
      const VerificationMeta('recordMood');
  @override
  late final GeneratedColumn<String> recordMood = GeneratedColumn<String>(
      'record_mood', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createAtMeta =
      const VerificationMeta('createAt');
  @override
  late final GeneratedColumn<DateTime> createAt = GeneratedColumn<DateTime>(
      'create_at', aliasedName, false,
      generatedAs: GeneratedAs(currentDateAndTime, false),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      generatedAs: GeneratedAs(currentDateAndTime, false),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, imageMood, recordMood, createAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mood_track';
  @override
  VerificationContext validateIntegrity(Insertable<MoodTrackData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('image_mood')) {
      context.handle(_imageMoodMeta,
          imageMood.isAcceptableOrUnknown(data['image_mood']!, _imageMoodMeta));
    } else if (isInserting) {
      context.missing(_imageMoodMeta);
    }
    if (data.containsKey('record_mood')) {
      context.handle(
          _recordMoodMeta,
          recordMood.isAcceptableOrUnknown(
              data['record_mood']!, _recordMoodMeta));
    } else if (isInserting) {
      context.missing(_recordMoodMeta);
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoodTrackData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoodTrackData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      imageMood: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_mood'])!,
      recordMood: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_mood'])!,
      createAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MoodTrackTable createAlias(String alias) {
    return $MoodTrackTable(attachedDatabase, alias);
  }
}

class MoodTrackData extends DataClass implements Insertable<MoodTrackData> {
  final int id;
  final int userId;
  final String imageMood;
  final String recordMood;
  final DateTime createAt;
  final DateTime updatedAt;
  const MoodTrackData(
      {required this.id,
      required this.userId,
      required this.imageMood,
      required this.recordMood,
      required this.createAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['image_mood'] = Variable<String>(imageMood);
    map['record_mood'] = Variable<String>(recordMood);
    return map;
  }

  MoodTrackCompanion toCompanion(bool nullToAbsent) {
    return MoodTrackCompanion(
      id: Value(id),
      userId: Value(userId),
      imageMood: Value(imageMood),
      recordMood: Value(recordMood),
    );
  }

  factory MoodTrackData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoodTrackData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      imageMood: serializer.fromJson<String>(json['imageMood']),
      recordMood: serializer.fromJson<String>(json['recordMood']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'imageMood': serializer.toJson<String>(imageMood),
      'recordMood': serializer.toJson<String>(recordMood),
      'createAt': serializer.toJson<DateTime>(createAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MoodTrackData copyWith(
          {int? id,
          int? userId,
          String? imageMood,
          String? recordMood,
          DateTime? createAt,
          DateTime? updatedAt}) =>
      MoodTrackData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        imageMood: imageMood ?? this.imageMood,
        recordMood: recordMood ?? this.recordMood,
        createAt: createAt ?? this.createAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('MoodTrackData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('imageMood: $imageMood, ')
          ..write('recordMood: $recordMood, ')
          ..write('createAt: $createAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, imageMood, recordMood, createAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoodTrackData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.imageMood == this.imageMood &&
          other.recordMood == this.recordMood &&
          other.createAt == this.createAt &&
          other.updatedAt == this.updatedAt);
}

class MoodTrackCompanion extends UpdateCompanion<MoodTrackData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> imageMood;
  final Value<String> recordMood;
  const MoodTrackCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.imageMood = const Value.absent(),
    this.recordMood = const Value.absent(),
  });
  MoodTrackCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String imageMood,
    required String recordMood,
  })  : userId = Value(userId),
        imageMood = Value(imageMood),
        recordMood = Value(recordMood);
  static Insertable<MoodTrackData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? imageMood,
    Expression<String>? recordMood,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (imageMood != null) 'image_mood': imageMood,
      if (recordMood != null) 'record_mood': recordMood,
    });
  }

  MoodTrackCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? imageMood,
      Value<String>? recordMood}) {
    return MoodTrackCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      imageMood: imageMood ?? this.imageMood,
      recordMood: recordMood ?? this.recordMood,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (imageMood.present) {
      map['image_mood'] = Variable<String>(imageMood.value);
    }
    if (recordMood.present) {
      map['record_mood'] = Variable<String>(recordMood.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoodTrackCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('imageMood: $imageMood, ')
          ..write('recordMood: $recordMood')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $UserTable user = $UserTable(this);
  late final $MoodTrackTable moodTrack = $MoodTrackTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, moodTrack];
}

typedef $$UserTableCreateCompanionBuilder = UserCompanion Function({
  Value<int> id,
  required String name,
  required String email,
  required String password,
  required String gender,
  required int age,
  required String avatar,
});
typedef $$UserTableUpdateCompanionBuilder = UserCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> email,
  Value<String> password,
  Value<String> gender,
  Value<int> age,
  Value<String> avatar,
});

class $$UserTableFilterComposer extends Composer<_$Database, $UserTable> {
  $$UserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatar => $composableBuilder(
      column: $table.avatar, builder: (column) => ColumnFilters(column));
}

class $$UserTableOrderingComposer extends Composer<_$Database, $UserTable> {
  $$UserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatar => $composableBuilder(
      column: $table.avatar, builder: (column) => ColumnOrderings(column));
}

class $$UserTableAnnotationComposer extends Composer<_$Database, $UserTable> {
  $$UserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);
}

class $$UserTableTableManager extends RootTableManager<
    _$Database,
    $UserTable,
    UserData,
    $$UserTableFilterComposer,
    $$UserTableOrderingComposer,
    $$UserTableAnnotationComposer,
    $$UserTableCreateCompanionBuilder,
    $$UserTableUpdateCompanionBuilder,
    (UserData, BaseReferences<_$Database, $UserTable, UserData>),
    UserData,
    PrefetchHooks Function()> {
  $$UserTableTableManager(_$Database db, $UserTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<int> age = const Value.absent(),
            Value<String> avatar = const Value.absent(),
          }) =>
              UserCompanion(
            id: id,
            name: name,
            email: email,
            password: password,
            gender: gender,
            age: age,
            avatar: avatar,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String email,
            required String password,
            required String gender,
            required int age,
            required String avatar,
          }) =>
              UserCompanion.insert(
            id: id,
            name: name,
            email: email,
            password: password,
            gender: gender,
            age: age,
            avatar: avatar,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $UserTable,
    UserData,
    $$UserTableFilterComposer,
    $$UserTableOrderingComposer,
    $$UserTableAnnotationComposer,
    $$UserTableCreateCompanionBuilder,
    $$UserTableUpdateCompanionBuilder,
    (UserData, BaseReferences<_$Database, $UserTable, UserData>),
    UserData,
    PrefetchHooks Function()>;
typedef $$MoodTrackTableCreateCompanionBuilder = MoodTrackCompanion Function({
  Value<int> id,
  required int userId,
  required String imageMood,
  required String recordMood,
});
typedef $$MoodTrackTableUpdateCompanionBuilder = MoodTrackCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<String> imageMood,
  Value<String> recordMood,
});

class $$MoodTrackTableFilterComposer
    extends Composer<_$Database, $MoodTrackTable> {
  $$MoodTrackTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageMood => $composableBuilder(
      column: $table.imageMood, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recordMood => $composableBuilder(
      column: $table.recordMood, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createAt => $composableBuilder(
      column: $table.createAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MoodTrackTableOrderingComposer
    extends Composer<_$Database, $MoodTrackTable> {
  $$MoodTrackTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageMood => $composableBuilder(
      column: $table.imageMood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recordMood => $composableBuilder(
      column: $table.recordMood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createAt => $composableBuilder(
      column: $table.createAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MoodTrackTableAnnotationComposer
    extends Composer<_$Database, $MoodTrackTable> {
  $$MoodTrackTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get imageMood =>
      $composableBuilder(column: $table.imageMood, builder: (column) => column);

  GeneratedColumn<String> get recordMood => $composableBuilder(
      column: $table.recordMood, builder: (column) => column);

  GeneratedColumn<DateTime> get createAt =>
      $composableBuilder(column: $table.createAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MoodTrackTableTableManager extends RootTableManager<
    _$Database,
    $MoodTrackTable,
    MoodTrackData,
    $$MoodTrackTableFilterComposer,
    $$MoodTrackTableOrderingComposer,
    $$MoodTrackTableAnnotationComposer,
    $$MoodTrackTableCreateCompanionBuilder,
    $$MoodTrackTableUpdateCompanionBuilder,
    (MoodTrackData, BaseReferences<_$Database, $MoodTrackTable, MoodTrackData>),
    MoodTrackData,
    PrefetchHooks Function()> {
  $$MoodTrackTableTableManager(_$Database db, $MoodTrackTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MoodTrackTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MoodTrackTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MoodTrackTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> imageMood = const Value.absent(),
            Value<String> recordMood = const Value.absent(),
          }) =>
              MoodTrackCompanion(
            id: id,
            userId: userId,
            imageMood: imageMood,
            recordMood: recordMood,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String imageMood,
            required String recordMood,
          }) =>
              MoodTrackCompanion.insert(
            id: id,
            userId: userId,
            imageMood: imageMood,
            recordMood: recordMood,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MoodTrackTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $MoodTrackTable,
    MoodTrackData,
    $$MoodTrackTableFilterComposer,
    $$MoodTrackTableOrderingComposer,
    $$MoodTrackTableAnnotationComposer,
    $$MoodTrackTableCreateCompanionBuilder,
    $$MoodTrackTableUpdateCompanionBuilder,
    (MoodTrackData, BaseReferences<_$Database, $MoodTrackTable, MoodTrackData>),
    MoodTrackData,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
  $$MoodTrackTableTableManager get moodTrack =>
      $$MoodTrackTableTableManager(_db, _db.moodTrack);
}
