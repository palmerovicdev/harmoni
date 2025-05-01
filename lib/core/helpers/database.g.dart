// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _settingsMeta =
      const VerificationMeta('settings');
  @override
  late final GeneratedColumn<String> settings = GeneratedColumn<String>(
      'settings', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        email,
        password,
        gender,
        age,
        avatar,
        settings,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
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
    if (data.containsKey('settings')) {
      context.handle(_settingsMeta,
          settings.isAcceptableOrUnknown(data['settings']!, _settingsMeta));
    } else if (isInserting) {
      context.missing(_settingsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
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
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
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
      settings: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settings'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String name;
  final String email;
  final String password;
  final String gender;
  final int age;
  final String avatar;
  final String settings;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserTableData(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.gender,
      required this.age,
      required this.avatar,
      required this.settings,
      required this.createdAt,
      required this.updatedAt});
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
    map['settings'] = Variable<String>(settings);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      password: Value(password),
      gender: Value(gender),
      age: Value(age),
      avatar: Value(avatar),
      settings: Value(settings),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      gender: serializer.fromJson<String>(json['gender']),
      age: serializer.fromJson<int>(json['age']),
      avatar: serializer.fromJson<String>(json['avatar']),
      settings: serializer.fromJson<String>(json['settings']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
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
      'settings': serializer.toJson<String>(settings),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserTableData copyWith(
          {int? id,
          String? name,
          String? email,
          String? password,
          String? gender,
          int? age,
          String? avatar,
          String? settings,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      UserTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        avatar: avatar ?? this.avatar,
        settings: settings ?? this.settings,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      gender: data.gender.present ? data.gender.value : this.gender,
      age: data.age.present ? data.age.value : this.age,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      settings: data.settings.present ? data.settings.value : this.settings,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('avatar: $avatar, ')
          ..write('settings: $settings, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, password, gender, age,
      avatar, settings, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.password == this.password &&
          other.gender == this.gender &&
          other.age == this.age &&
          other.avatar == this.avatar &&
          other.settings == this.settings &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> password;
  final Value<String> gender;
  final Value<int> age;
  final Value<String> avatar;
  final Value<String> settings;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.gender = const Value.absent(),
    this.age = const Value.absent(),
    this.avatar = const Value.absent(),
    this.settings = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String password,
    required String gender,
    required int age,
    required String avatar,
    required String settings,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        email = Value(email),
        password = Value(password),
        gender = Value(gender),
        age = Value(age),
        avatar = Value(avatar),
        settings = Value(settings);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? gender,
    Expression<int>? age,
    Expression<String>? avatar,
    Expression<String>? settings,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (gender != null) 'gender': gender,
      if (age != null) 'age': age,
      if (avatar != null) 'avatar': avatar,
      if (settings != null) 'settings': settings,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? password,
      Value<String>? gender,
      Value<int>? age,
      Value<String>? avatar,
      Value<String>? settings,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      avatar: avatar ?? this.avatar,
      settings: settings ?? this.settings,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (settings.present) {
      map['settings'] = Variable<String>(settings.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('avatar: $avatar, ')
          ..write('settings: $settings, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MoodTrackTableTable extends MoodTrackTable
    with TableInfo<$MoodTrackTableTable, MoodTrackTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoodTrackTableTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user_table (id) ON DELETE CASCADE'));
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
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, imageMood, recordMood, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mood_track_table';
  @override
  VerificationContext validateIntegrity(Insertable<MoodTrackTableData> instance,
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
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
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
  MoodTrackTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoodTrackTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      imageMood: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_mood'])!,
      recordMood: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_mood'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MoodTrackTableTable createAlias(String alias) {
    return $MoodTrackTableTable(attachedDatabase, alias);
  }
}

class MoodTrackTableData extends DataClass
    implements Insertable<MoodTrackTableData> {
  final int id;
  final int userId;
  final String imageMood;
  final String recordMood;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MoodTrackTableData(
      {required this.id,
      required this.userId,
      required this.imageMood,
      required this.recordMood,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['image_mood'] = Variable<String>(imageMood);
    map['record_mood'] = Variable<String>(recordMood);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MoodTrackTableCompanion toCompanion(bool nullToAbsent) {
    return MoodTrackTableCompanion(
      id: Value(id),
      userId: Value(userId),
      imageMood: Value(imageMood),
      recordMood: Value(recordMood),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MoodTrackTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoodTrackTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      imageMood: serializer.fromJson<String>(json['imageMood']),
      recordMood: serializer.fromJson<String>(json['recordMood']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
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
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MoodTrackTableData copyWith(
          {int? id,
          int? userId,
          String? imageMood,
          String? recordMood,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MoodTrackTableData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        imageMood: imageMood ?? this.imageMood,
        recordMood: recordMood ?? this.recordMood,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MoodTrackTableData copyWithCompanion(MoodTrackTableCompanion data) {
    return MoodTrackTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      imageMood: data.imageMood.present ? data.imageMood.value : this.imageMood,
      recordMood:
          data.recordMood.present ? data.recordMood.value : this.recordMood,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MoodTrackTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('imageMood: $imageMood, ')
          ..write('recordMood: $recordMood, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, imageMood, recordMood, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoodTrackTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.imageMood == this.imageMood &&
          other.recordMood == this.recordMood &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MoodTrackTableCompanion extends UpdateCompanion<MoodTrackTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> imageMood;
  final Value<String> recordMood;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const MoodTrackTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.imageMood = const Value.absent(),
    this.recordMood = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MoodTrackTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String imageMood,
    required String recordMood,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : userId = Value(userId),
        imageMood = Value(imageMood),
        recordMood = Value(recordMood);
  static Insertable<MoodTrackTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? imageMood,
    Expression<String>? recordMood,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (imageMood != null) 'image_mood': imageMood,
      if (recordMood != null) 'record_mood': recordMood,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MoodTrackTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? imageMood,
      Value<String>? recordMood,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return MoodTrackTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      imageMood: imageMood ?? this.imageMood,
      recordMood: recordMood ?? this.recordMood,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoodTrackTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('imageMood: $imageMood, ')
          ..write('recordMood: $recordMood, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ActivityGroupTableTable extends ActivityGroupTable
    with TableInfo<$ActivityGroupTableTable, ActivityGroupTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityGroupTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, image, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_group_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ActivityGroupTableData> instance,
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
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
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
  ActivityGroupTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityGroupTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ActivityGroupTableTable createAlias(String alias) {
    return $ActivityGroupTableTable(attachedDatabase, alias);
  }
}

class ActivityGroupTableData extends DataClass
    implements Insertable<ActivityGroupTableData> {
  final int id;
  final String name;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ActivityGroupTableData(
      {required this.id,
      required this.name,
      required this.image,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ActivityGroupTableCompanion toCompanion(bool nullToAbsent) {
    return ActivityGroupTableCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ActivityGroupTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityGroupTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ActivityGroupTableData copyWith(
          {int? id,
          String? name,
          String? image,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ActivityGroupTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ActivityGroupTableData copyWithCompanion(ActivityGroupTableCompanion data) {
    return ActivityGroupTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityGroupTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityGroupTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ActivityGroupTableCompanion
    extends UpdateCompanion<ActivityGroupTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ActivityGroupTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ActivityGroupTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        image = Value(image);
  static Insertable<ActivityGroupTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ActivityGroupTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? image,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ActivityGroupTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityGroupTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ActivityTableTable extends ActivityTable
    with TableInfo<$ActivityTableTable, ActivityTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activityGroupIdMeta =
      const VerificationMeta('activityGroupId');
  @override
  late final GeneratedColumn<int> activityGroupId = GeneratedColumn<int>(
      'activity_group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES activity_group_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, image, activityGroupId, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_table';
  @override
  VerificationContext validateIntegrity(Insertable<ActivityTableData> instance,
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
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('activity_group_id')) {
      context.handle(
          _activityGroupIdMeta,
          activityGroupId.isAcceptableOrUnknown(
              data['activity_group_id']!, _activityGroupIdMeta));
    } else if (isInserting) {
      context.missing(_activityGroupIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
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
  ActivityTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      activityGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}activity_group_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ActivityTableTable createAlias(String alias) {
    return $ActivityTableTable(attachedDatabase, alias);
  }
}

class ActivityTableData extends DataClass
    implements Insertable<ActivityTableData> {
  final int id;
  final String name;
  final String image;
  final int activityGroupId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ActivityTableData(
      {required this.id,
      required this.name,
      required this.image,
      required this.activityGroupId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    map['activity_group_id'] = Variable<int>(activityGroupId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ActivityTableCompanion toCompanion(bool nullToAbsent) {
    return ActivityTableCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
      activityGroupId: Value(activityGroupId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ActivityTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      activityGroupId: serializer.fromJson<int>(json['activityGroupId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'activityGroupId': serializer.toJson<int>(activityGroupId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ActivityTableData copyWith(
          {int? id,
          String? name,
          String? image,
          int? activityGroupId,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ActivityTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        activityGroupId: activityGroupId ?? this.activityGroupId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ActivityTableData copyWithCompanion(ActivityTableCompanion data) {
    return ActivityTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      activityGroupId: data.activityGroupId.present
          ? data.activityGroupId.value
          : this.activityGroupId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('activityGroupId: $activityGroupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, image, activityGroupId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.activityGroupId == this.activityGroupId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ActivityTableCompanion extends UpdateCompanion<ActivityTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<int> activityGroupId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ActivityTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.activityGroupId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ActivityTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
    required int activityGroupId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        image = Value(image),
        activityGroupId = Value(activityGroupId);
  static Insertable<ActivityTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<int>? activityGroupId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (activityGroupId != null) 'activity_group_id': activityGroupId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ActivityTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? image,
      Value<int>? activityGroupId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ActivityTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      activityGroupId: activityGroupId ?? this.activityGroupId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (activityGroupId.present) {
      map['activity_group_id'] = Variable<int>(activityGroupId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('activityGroupId: $activityGroupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MoodActivityRelationTableTable extends MoodActivityRelationTable
    with
        TableInfo<$MoodActivityRelationTableTable,
            MoodActivityRelationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoodActivityRelationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _moodTrackIdMeta =
      const VerificationMeta('moodTrackId');
  @override
  late final GeneratedColumn<int> moodTrackId = GeneratedColumn<int>(
      'mood_track_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES mood_track_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _activityIdMeta =
      const VerificationMeta('activityId');
  @override
  late final GeneratedColumn<int> activityId = GeneratedColumn<int>(
      'activity_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES activity_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, moodTrackId, activityId, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mood_activity_relation_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MoodActivityRelationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mood_track_id')) {
      context.handle(
          _moodTrackIdMeta,
          moodTrackId.isAcceptableOrUnknown(
              data['mood_track_id']!, _moodTrackIdMeta));
    } else if (isInserting) {
      context.missing(_moodTrackIdMeta);
    }
    if (data.containsKey('activity_id')) {
      context.handle(
          _activityIdMeta,
          activityId.isAcceptableOrUnknown(
              data['activity_id']!, _activityIdMeta));
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
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
  MoodActivityRelationTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoodActivityRelationTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      moodTrackId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mood_track_id'])!,
      activityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}activity_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MoodActivityRelationTableTable createAlias(String alias) {
    return $MoodActivityRelationTableTable(attachedDatabase, alias);
  }
}

class MoodActivityRelationTableData extends DataClass
    implements Insertable<MoodActivityRelationTableData> {
  final int id;
  final int moodTrackId;
  final int activityId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MoodActivityRelationTableData(
      {required this.id,
      required this.moodTrackId,
      required this.activityId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mood_track_id'] = Variable<int>(moodTrackId);
    map['activity_id'] = Variable<int>(activityId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MoodActivityRelationTableCompanion toCompanion(bool nullToAbsent) {
    return MoodActivityRelationTableCompanion(
      id: Value(id),
      moodTrackId: Value(moodTrackId),
      activityId: Value(activityId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MoodActivityRelationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoodActivityRelationTableData(
      id: serializer.fromJson<int>(json['id']),
      moodTrackId: serializer.fromJson<int>(json['moodTrackId']),
      activityId: serializer.fromJson<int>(json['activityId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'moodTrackId': serializer.toJson<int>(moodTrackId),
      'activityId': serializer.toJson<int>(activityId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MoodActivityRelationTableData copyWith(
          {int? id,
          int? moodTrackId,
          int? activityId,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MoodActivityRelationTableData(
        id: id ?? this.id,
        moodTrackId: moodTrackId ?? this.moodTrackId,
        activityId: activityId ?? this.activityId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MoodActivityRelationTableData copyWithCompanion(
      MoodActivityRelationTableCompanion data) {
    return MoodActivityRelationTableData(
      id: data.id.present ? data.id.value : this.id,
      moodTrackId:
          data.moodTrackId.present ? data.moodTrackId.value : this.moodTrackId,
      activityId:
          data.activityId.present ? data.activityId.value : this.activityId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MoodActivityRelationTableData(')
          ..write('id: $id, ')
          ..write('moodTrackId: $moodTrackId, ')
          ..write('activityId: $activityId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, moodTrackId, activityId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoodActivityRelationTableData &&
          other.id == this.id &&
          other.moodTrackId == this.moodTrackId &&
          other.activityId == this.activityId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MoodActivityRelationTableCompanion
    extends UpdateCompanion<MoodActivityRelationTableData> {
  final Value<int> id;
  final Value<int> moodTrackId;
  final Value<int> activityId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const MoodActivityRelationTableCompanion({
    this.id = const Value.absent(),
    this.moodTrackId = const Value.absent(),
    this.activityId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MoodActivityRelationTableCompanion.insert({
    this.id = const Value.absent(),
    required int moodTrackId,
    required int activityId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : moodTrackId = Value(moodTrackId),
        activityId = Value(activityId);
  static Insertable<MoodActivityRelationTableData> custom({
    Expression<int>? id,
    Expression<int>? moodTrackId,
    Expression<int>? activityId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (moodTrackId != null) 'mood_track_id': moodTrackId,
      if (activityId != null) 'activity_id': activityId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MoodActivityRelationTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? moodTrackId,
      Value<int>? activityId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return MoodActivityRelationTableCompanion(
      id: id ?? this.id,
      moodTrackId: moodTrackId ?? this.moodTrackId,
      activityId: activityId ?? this.activityId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (moodTrackId.present) {
      map['mood_track_id'] = Variable<int>(moodTrackId.value);
    }
    if (activityId.present) {
      map['activity_id'] = Variable<int>(activityId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoodActivityRelationTableCompanion(')
          ..write('id: $id, ')
          ..write('moodTrackId: $moodTrackId, ')
          ..write('activityId: $activityId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $MoodTrackTableTable moodTrackTable = $MoodTrackTableTable(this);
  late final $ActivityGroupTableTable activityGroupTable =
      $ActivityGroupTableTable(this);
  late final $ActivityTableTable activityTable = $ActivityTableTable(this);
  late final $MoodActivityRelationTableTable moodActivityRelationTable =
      $MoodActivityRelationTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userTable,
        moodTrackTable,
        activityGroupTable,
        activityTable,
        moodActivityRelationTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('user_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('mood_track_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('activity_group_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('activity_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('mood_track_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('mood_activity_relation_table',
                  kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('activity_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('mood_activity_relation_table',
                  kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$UserTableTableCreateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  required String name,
  required String email,
  required String password,
  required String gender,
  required int age,
  required String avatar,
  required String settings,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$UserTableTableUpdateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> email,
  Value<String> password,
  Value<String> gender,
  Value<int> age,
  Value<String> avatar,
  Value<String> settings,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$UserTableTableReferences
    extends BaseReferences<_$Database, $UserTableTable, UserTableData> {
  $$UserTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MoodTrackTableTable, List<MoodTrackTableData>>
      _moodTrackTableRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.moodTrackTable,
          aliasName:
              $_aliasNameGenerator(db.userTable.id, db.moodTrackTable.userId));

  $$MoodTrackTableTableProcessedTableManager get moodTrackTableRefs {
    final manager = $$MoodTrackTableTableTableManager($_db, $_db.moodTrackTable)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_moodTrackTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UserTableTableFilterComposer
    extends Composer<_$Database, $UserTableTable> {
  $$UserTableTableFilterComposer({
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

  ColumnFilters<String> get settings => $composableBuilder(
      column: $table.settings, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> moodTrackTableRefs(
      Expression<bool> Function($$MoodTrackTableTableFilterComposer f) f) {
    final $$MoodTrackTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.moodTrackTable,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MoodTrackTableTableFilterComposer(
              $db: $db,
              $table: $db.moodTrackTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UserTableTableOrderingComposer
    extends Composer<_$Database, $UserTableTable> {
  $$UserTableTableOrderingComposer({
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

  ColumnOrderings<String> get settings => $composableBuilder(
      column: $table.settings, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$Database, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
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

  GeneratedColumn<String> get settings =>
      $composableBuilder(column: $table.settings, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> moodTrackTableRefs<T extends Object>(
      Expression<T> Function($$MoodTrackTableTableAnnotationComposer a) f) {
    final $$MoodTrackTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.moodTrackTable,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MoodTrackTableTableAnnotationComposer(
              $db: $db,
              $table: $db.moodTrackTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UserTableTableTableManager extends RootTableManager<
    _$Database,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (UserTableData, $$UserTableTableReferences),
    UserTableData,
    PrefetchHooks Function({bool moodTrackTableRefs})> {
  $$UserTableTableTableManager(_$Database db, $UserTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<int> age = const Value.absent(),
            Value<String> avatar = const Value.absent(),
            Value<String> settings = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UserTableCompanion(
            id: id,
            name: name,
            email: email,
            password: password,
            gender: gender,
            age: age,
            avatar: avatar,
            settings: settings,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String email,
            required String password,
            required String gender,
            required int age,
            required String avatar,
            required String settings,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UserTableCompanion.insert(
            id: id,
            name: name,
            email: email,
            password: password,
            gender: gender,
            age: age,
            avatar: avatar,
            settings: settings,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({moodTrackTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (moodTrackTableRefs) db.moodTrackTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (moodTrackTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$UserTableTableReferences
                            ._moodTrackTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UserTableTableReferences(db, table, p0)
                                .moodTrackTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UserTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (UserTableData, $$UserTableTableReferences),
    UserTableData,
    PrefetchHooks Function({bool moodTrackTableRefs})>;
typedef $$MoodTrackTableTableCreateCompanionBuilder = MoodTrackTableCompanion
    Function({
  Value<int> id,
  required int userId,
  required String imageMood,
  required String recordMood,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$MoodTrackTableTableUpdateCompanionBuilder = MoodTrackTableCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<String> imageMood,
  Value<String> recordMood,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$MoodTrackTableTableReferences extends BaseReferences<_$Database,
    $MoodTrackTableTable, MoodTrackTableData> {
  $$MoodTrackTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $UserTableTable _userIdTable(_$Database db) =>
      db.userTable.createAlias(
          $_aliasNameGenerator(db.moodTrackTable.userId, db.userTable.id));

  $$UserTableTableProcessedTableManager get userId {
    final manager = $$UserTableTableTableManager($_db, $_db.userTable)
        .filter((f) => f.id($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$MoodActivityRelationTableTable,
      List<MoodActivityRelationTableData>> _moodActivityRelationTableRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.moodActivityRelationTable,
          aliasName: $_aliasNameGenerator(
              db.moodTrackTable.id, db.moodActivityRelationTable.moodTrackId));

  $$MoodActivityRelationTableTableProcessedTableManager
      get moodActivityRelationTableRefs {
    final manager = $$MoodActivityRelationTableTableTableManager(
            $_db, $_db.moodActivityRelationTable)
        .filter((f) => f.moodTrackId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_moodActivityRelationTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MoodTrackTableTableFilterComposer
    extends Composer<_$Database, $MoodTrackTableTable> {
  $$MoodTrackTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageMood => $composableBuilder(
      column: $table.imageMood, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recordMood => $composableBuilder(
      column: $table.recordMood, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$UserTableTableFilterComposer get userId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableFilterComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> moodActivityRelationTableRefs(
      Expression<bool> Function(
              $$MoodActivityRelationTableTableFilterComposer f)
          f) {
    final $$MoodActivityRelationTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.moodActivityRelationTable,
            getReferencedColumn: (t) => t.moodTrackId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MoodActivityRelationTableTableFilterComposer(
                  $db: $db,
                  $table: $db.moodActivityRelationTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$MoodTrackTableTableOrderingComposer
    extends Composer<_$Database, $MoodTrackTableTable> {
  $$MoodTrackTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageMood => $composableBuilder(
      column: $table.imageMood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recordMood => $composableBuilder(
      column: $table.recordMood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$UserTableTableOrderingComposer get userId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableOrderingComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MoodTrackTableTableAnnotationComposer
    extends Composer<_$Database, $MoodTrackTableTable> {
  $$MoodTrackTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageMood =>
      $composableBuilder(column: $table.imageMood, builder: (column) => column);

  GeneratedColumn<String> get recordMood => $composableBuilder(
      column: $table.recordMood, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UserTableTableAnnotationComposer get userId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableAnnotationComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> moodActivityRelationTableRefs<T extends Object>(
      Expression<T> Function(
              $$MoodActivityRelationTableTableAnnotationComposer a)
          f) {
    final $$MoodActivityRelationTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.moodActivityRelationTable,
            getReferencedColumn: (t) => t.moodTrackId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MoodActivityRelationTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.moodActivityRelationTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$MoodTrackTableTableTableManager extends RootTableManager<
    _$Database,
    $MoodTrackTableTable,
    MoodTrackTableData,
    $$MoodTrackTableTableFilterComposer,
    $$MoodTrackTableTableOrderingComposer,
    $$MoodTrackTableTableAnnotationComposer,
    $$MoodTrackTableTableCreateCompanionBuilder,
    $$MoodTrackTableTableUpdateCompanionBuilder,
    (MoodTrackTableData, $$MoodTrackTableTableReferences),
    MoodTrackTableData,
    PrefetchHooks Function({bool userId, bool moodActivityRelationTableRefs})> {
  $$MoodTrackTableTableTableManager(_$Database db, $MoodTrackTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MoodTrackTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MoodTrackTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MoodTrackTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> imageMood = const Value.absent(),
            Value<String> recordMood = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              MoodTrackTableCompanion(
            id: id,
            userId: userId,
            imageMood: imageMood,
            recordMood: recordMood,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String imageMood,
            required String recordMood,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              MoodTrackTableCompanion.insert(
            id: id,
            userId: userId,
            imageMood: imageMood,
            recordMood: recordMood,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MoodTrackTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userId = false, moodActivityRelationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (moodActivityRelationTableRefs) db.moodActivityRelationTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$MoodTrackTableTableReferences._userIdTable(db),
                    referencedColumn:
                        $$MoodTrackTableTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (moodActivityRelationTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MoodTrackTableTableReferences
                            ._moodActivityRelationTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MoodTrackTableTableReferences(db, table, p0)
                                .moodActivityRelationTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.moodTrackId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MoodTrackTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $MoodTrackTableTable,
    MoodTrackTableData,
    $$MoodTrackTableTableFilterComposer,
    $$MoodTrackTableTableOrderingComposer,
    $$MoodTrackTableTableAnnotationComposer,
    $$MoodTrackTableTableCreateCompanionBuilder,
    $$MoodTrackTableTableUpdateCompanionBuilder,
    (MoodTrackTableData, $$MoodTrackTableTableReferences),
    MoodTrackTableData,
    PrefetchHooks Function({bool userId, bool moodActivityRelationTableRefs})>;
typedef $$ActivityGroupTableTableCreateCompanionBuilder
    = ActivityGroupTableCompanion Function({
  Value<int> id,
  required String name,
  required String image,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ActivityGroupTableTableUpdateCompanionBuilder
    = ActivityGroupTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> image,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$ActivityGroupTableTableReferences extends BaseReferences<
    _$Database, $ActivityGroupTableTable, ActivityGroupTableData> {
  $$ActivityGroupTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ActivityTableTable, List<ActivityTableData>>
      _activityTableRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.activityTable,
              aliasName: $_aliasNameGenerator(
                  db.activityGroupTable.id, db.activityTable.activityGroupId));

  $$ActivityTableTableProcessedTableManager get activityTableRefs {
    final manager = $$ActivityTableTableTableManager($_db, $_db.activityTable)
        .filter((f) => f.activityGroupId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_activityTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ActivityGroupTableTableFilterComposer
    extends Composer<_$Database, $ActivityGroupTableTable> {
  $$ActivityGroupTableTableFilterComposer({
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

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> activityTableRefs(
      Expression<bool> Function($$ActivityTableTableFilterComposer f) f) {
    final $$ActivityTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.activityTable,
        getReferencedColumn: (t) => t.activityGroupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivityTableTableFilterComposer(
              $db: $db,
              $table: $db.activityTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ActivityGroupTableTableOrderingComposer
    extends Composer<_$Database, $ActivityGroupTableTable> {
  $$ActivityGroupTableTableOrderingComposer({
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

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ActivityGroupTableTableAnnotationComposer
    extends Composer<_$Database, $ActivityGroupTableTable> {
  $$ActivityGroupTableTableAnnotationComposer({
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

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> activityTableRefs<T extends Object>(
      Expression<T> Function($$ActivityTableTableAnnotationComposer a) f) {
    final $$ActivityTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.activityTable,
        getReferencedColumn: (t) => t.activityGroupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivityTableTableAnnotationComposer(
              $db: $db,
              $table: $db.activityTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ActivityGroupTableTableTableManager extends RootTableManager<
    _$Database,
    $ActivityGroupTableTable,
    ActivityGroupTableData,
    $$ActivityGroupTableTableFilterComposer,
    $$ActivityGroupTableTableOrderingComposer,
    $$ActivityGroupTableTableAnnotationComposer,
    $$ActivityGroupTableTableCreateCompanionBuilder,
    $$ActivityGroupTableTableUpdateCompanionBuilder,
    (ActivityGroupTableData, $$ActivityGroupTableTableReferences),
    ActivityGroupTableData,
    PrefetchHooks Function({bool activityTableRefs})> {
  $$ActivityGroupTableTableTableManager(
      _$Database db, $ActivityGroupTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityGroupTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityGroupTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityGroupTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ActivityGroupTableCompanion(
            id: id,
            name: name,
            image: image,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String image,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ActivityGroupTableCompanion.insert(
            id: id,
            name: name,
            image: image,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ActivityGroupTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({activityTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (activityTableRefs) db.activityTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (activityTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ActivityGroupTableTableReferences
                            ._activityTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ActivityGroupTableTableReferences(db, table, p0)
                                .activityTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.activityGroupId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ActivityGroupTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $ActivityGroupTableTable,
    ActivityGroupTableData,
    $$ActivityGroupTableTableFilterComposer,
    $$ActivityGroupTableTableOrderingComposer,
    $$ActivityGroupTableTableAnnotationComposer,
    $$ActivityGroupTableTableCreateCompanionBuilder,
    $$ActivityGroupTableTableUpdateCompanionBuilder,
    (ActivityGroupTableData, $$ActivityGroupTableTableReferences),
    ActivityGroupTableData,
    PrefetchHooks Function({bool activityTableRefs})>;
typedef $$ActivityTableTableCreateCompanionBuilder = ActivityTableCompanion
    Function({
  Value<int> id,
  required String name,
  required String image,
  required int activityGroupId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ActivityTableTableUpdateCompanionBuilder = ActivityTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> image,
  Value<int> activityGroupId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$ActivityTableTableReferences
    extends BaseReferences<_$Database, $ActivityTableTable, ActivityTableData> {
  $$ActivityTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ActivityGroupTableTable _activityGroupIdTable(_$Database db) =>
      db.activityGroupTable.createAlias($_aliasNameGenerator(
          db.activityTable.activityGroupId, db.activityGroupTable.id));

  $$ActivityGroupTableTableProcessedTableManager get activityGroupId {
    final manager =
        $$ActivityGroupTableTableTableManager($_db, $_db.activityGroupTable)
            .filter((f) => f.id($_item.activityGroupId));
    final item = $_typedResult.readTableOrNull(_activityGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$MoodActivityRelationTableTable,
      List<MoodActivityRelationTableData>> _moodActivityRelationTableRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.moodActivityRelationTable,
          aliasName: $_aliasNameGenerator(
              db.activityTable.id, db.moodActivityRelationTable.activityId));

  $$MoodActivityRelationTableTableProcessedTableManager
      get moodActivityRelationTableRefs {
    final manager = $$MoodActivityRelationTableTableTableManager(
            $_db, $_db.moodActivityRelationTable)
        .filter((f) => f.activityId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_moodActivityRelationTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ActivityTableTableFilterComposer
    extends Composer<_$Database, $ActivityTableTable> {
  $$ActivityTableTableFilterComposer({
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

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$ActivityGroupTableTableFilterComposer get activityGroupId {
    final $$ActivityGroupTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityGroupId,
        referencedTable: $db.activityGroupTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivityGroupTableTableFilterComposer(
              $db: $db,
              $table: $db.activityGroupTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> moodActivityRelationTableRefs(
      Expression<bool> Function(
              $$MoodActivityRelationTableTableFilterComposer f)
          f) {
    final $$MoodActivityRelationTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.moodActivityRelationTable,
            getReferencedColumn: (t) => t.activityId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MoodActivityRelationTableTableFilterComposer(
                  $db: $db,
                  $table: $db.moodActivityRelationTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ActivityTableTableOrderingComposer
    extends Composer<_$Database, $ActivityTableTable> {
  $$ActivityTableTableOrderingComposer({
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

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$ActivityGroupTableTableOrderingComposer get activityGroupId {
    final $$ActivityGroupTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityGroupId,
        referencedTable: $db.activityGroupTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivityGroupTableTableOrderingComposer(
              $db: $db,
              $table: $db.activityGroupTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ActivityTableTableAnnotationComposer
    extends Composer<_$Database, $ActivityTableTable> {
  $$ActivityTableTableAnnotationComposer({
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

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ActivityGroupTableTableAnnotationComposer get activityGroupId {
    final $$ActivityGroupTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.activityGroupId,
            referencedTable: $db.activityGroupTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ActivityGroupTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.activityGroupTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> moodActivityRelationTableRefs<T extends Object>(
      Expression<T> Function(
              $$MoodActivityRelationTableTableAnnotationComposer a)
          f) {
    final $$MoodActivityRelationTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.moodActivityRelationTable,
            getReferencedColumn: (t) => t.activityId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MoodActivityRelationTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.moodActivityRelationTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ActivityTableTableTableManager extends RootTableManager<
    _$Database,
    $ActivityTableTable,
    ActivityTableData,
    $$ActivityTableTableFilterComposer,
    $$ActivityTableTableOrderingComposer,
    $$ActivityTableTableAnnotationComposer,
    $$ActivityTableTableCreateCompanionBuilder,
    $$ActivityTableTableUpdateCompanionBuilder,
    (ActivityTableData, $$ActivityTableTableReferences),
    ActivityTableData,
    PrefetchHooks Function(
        {bool activityGroupId, bool moodActivityRelationTableRefs})> {
  $$ActivityTableTableTableManager(_$Database db, $ActivityTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<int> activityGroupId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ActivityTableCompanion(
            id: id,
            name: name,
            image: image,
            activityGroupId: activityGroupId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String image,
            required int activityGroupId,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ActivityTableCompanion.insert(
            id: id,
            name: name,
            image: image,
            activityGroupId: activityGroupId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ActivityTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {activityGroupId = false,
              moodActivityRelationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (moodActivityRelationTableRefs) db.moodActivityRelationTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (activityGroupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.activityGroupId,
                    referencedTable: $$ActivityTableTableReferences
                        ._activityGroupIdTable(db),
                    referencedColumn: $$ActivityTableTableReferences
                        ._activityGroupIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (moodActivityRelationTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ActivityTableTableReferences
                            ._moodActivityRelationTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ActivityTableTableReferences(db, table, p0)
                                .moodActivityRelationTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.activityId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ActivityTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $ActivityTableTable,
    ActivityTableData,
    $$ActivityTableTableFilterComposer,
    $$ActivityTableTableOrderingComposer,
    $$ActivityTableTableAnnotationComposer,
    $$ActivityTableTableCreateCompanionBuilder,
    $$ActivityTableTableUpdateCompanionBuilder,
    (ActivityTableData, $$ActivityTableTableReferences),
    ActivityTableData,
    PrefetchHooks Function(
        {bool activityGroupId, bool moodActivityRelationTableRefs})>;
typedef $$MoodActivityRelationTableTableCreateCompanionBuilder
    = MoodActivityRelationTableCompanion Function({
  Value<int> id,
  required int moodTrackId,
  required int activityId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$MoodActivityRelationTableTableUpdateCompanionBuilder
    = MoodActivityRelationTableCompanion Function({
  Value<int> id,
  Value<int> moodTrackId,
  Value<int> activityId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$MoodActivityRelationTableTableReferences extends BaseReferences<
    _$Database,
    $MoodActivityRelationTableTable,
    MoodActivityRelationTableData> {
  $$MoodActivityRelationTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $MoodTrackTableTable _moodTrackIdTable(_$Database db) =>
      db.moodTrackTable.createAlias($_aliasNameGenerator(
          db.moodActivityRelationTable.moodTrackId, db.moodTrackTable.id));

  $$MoodTrackTableTableProcessedTableManager get moodTrackId {
    final manager = $$MoodTrackTableTableTableManager($_db, $_db.moodTrackTable)
        .filter((f) => f.id($_item.moodTrackId));
    final item = $_typedResult.readTableOrNull(_moodTrackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ActivityTableTable _activityIdTable(_$Database db) =>
      db.activityTable.createAlias($_aliasNameGenerator(
          db.moodActivityRelationTable.activityId, db.activityTable.id));

  $$ActivityTableTableProcessedTableManager get activityId {
    final manager = $$ActivityTableTableTableManager($_db, $_db.activityTable)
        .filter((f) => f.id($_item.activityId));
    final item = $_typedResult.readTableOrNull(_activityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MoodActivityRelationTableTableFilterComposer
    extends Composer<_$Database, $MoodActivityRelationTableTable> {
  $$MoodActivityRelationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$MoodTrackTableTableFilterComposer get moodTrackId {
    final $$MoodTrackTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.moodTrackId,
        referencedTable: $db.moodTrackTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MoodTrackTableTableFilterComposer(
              $db: $db,
              $table: $db.moodTrackTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ActivityTableTableFilterComposer get activityId {
    final $$ActivityTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityId,
        referencedTable: $db.activityTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivityTableTableFilterComposer(
              $db: $db,
              $table: $db.activityTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MoodActivityRelationTableTableOrderingComposer
    extends Composer<_$Database, $MoodActivityRelationTableTable> {
  $$MoodActivityRelationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$MoodTrackTableTableOrderingComposer get moodTrackId {
    final $$MoodTrackTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.moodTrackId,
        referencedTable: $db.moodTrackTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MoodTrackTableTableOrderingComposer(
              $db: $db,
              $table: $db.moodTrackTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ActivityTableTableOrderingComposer get activityId {
    final $$ActivityTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityId,
        referencedTable: $db.activityTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivityTableTableOrderingComposer(
              $db: $db,
              $table: $db.activityTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MoodActivityRelationTableTableAnnotationComposer
    extends Composer<_$Database, $MoodActivityRelationTableTable> {
  $$MoodActivityRelationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MoodTrackTableTableAnnotationComposer get moodTrackId {
    final $$MoodTrackTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.moodTrackId,
        referencedTable: $db.moodTrackTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MoodTrackTableTableAnnotationComposer(
              $db: $db,
              $table: $db.moodTrackTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ActivityTableTableAnnotationComposer get activityId {
    final $$ActivityTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityId,
        referencedTable: $db.activityTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivityTableTableAnnotationComposer(
              $db: $db,
              $table: $db.activityTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MoodActivityRelationTableTableTableManager extends RootTableManager<
    _$Database,
    $MoodActivityRelationTableTable,
    MoodActivityRelationTableData,
    $$MoodActivityRelationTableTableFilterComposer,
    $$MoodActivityRelationTableTableOrderingComposer,
    $$MoodActivityRelationTableTableAnnotationComposer,
    $$MoodActivityRelationTableTableCreateCompanionBuilder,
    $$MoodActivityRelationTableTableUpdateCompanionBuilder,
    (MoodActivityRelationTableData, $$MoodActivityRelationTableTableReferences),
    MoodActivityRelationTableData,
    PrefetchHooks Function({bool moodTrackId, bool activityId})> {
  $$MoodActivityRelationTableTableTableManager(
      _$Database db, $MoodActivityRelationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MoodActivityRelationTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MoodActivityRelationTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MoodActivityRelationTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> moodTrackId = const Value.absent(),
            Value<int> activityId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              MoodActivityRelationTableCompanion(
            id: id,
            moodTrackId: moodTrackId,
            activityId: activityId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int moodTrackId,
            required int activityId,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              MoodActivityRelationTableCompanion.insert(
            id: id,
            moodTrackId: moodTrackId,
            activityId: activityId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MoodActivityRelationTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({moodTrackId = false, activityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (moodTrackId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.moodTrackId,
                    referencedTable: $$MoodActivityRelationTableTableReferences
                        ._moodTrackIdTable(db),
                    referencedColumn: $$MoodActivityRelationTableTableReferences
                        ._moodTrackIdTable(db)
                        .id,
                  ) as T;
                }
                if (activityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.activityId,
                    referencedTable: $$MoodActivityRelationTableTableReferences
                        ._activityIdTable(db),
                    referencedColumn: $$MoodActivityRelationTableTableReferences
                        ._activityIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MoodActivityRelationTableTableProcessedTableManager
    = ProcessedTableManager<
        _$Database,
        $MoodActivityRelationTableTable,
        MoodActivityRelationTableData,
        $$MoodActivityRelationTableTableFilterComposer,
        $$MoodActivityRelationTableTableOrderingComposer,
        $$MoodActivityRelationTableTableAnnotationComposer,
        $$MoodActivityRelationTableTableCreateCompanionBuilder,
        $$MoodActivityRelationTableTableUpdateCompanionBuilder,
        (
          MoodActivityRelationTableData,
          $$MoodActivityRelationTableTableReferences
        ),
        MoodActivityRelationTableData,
        PrefetchHooks Function({bool moodTrackId, bool activityId})>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$MoodTrackTableTableTableManager get moodTrackTable =>
      $$MoodTrackTableTableTableManager(_db, _db.moodTrackTable);
  $$ActivityGroupTableTableTableManager get activityGroupTable =>
      $$ActivityGroupTableTableTableManager(_db, _db.activityGroupTable);
  $$ActivityTableTableTableManager get activityTable =>
      $$ActivityTableTableTableManager(_db, _db.activityTable);
  $$MoodActivityRelationTableTableTableManager get moodActivityRelationTable =>
      $$MoodActivityRelationTableTableTableManager(
          _db, _db.moodActivityRelationTable);
}
