import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../features/moodtrack/model/entity/mood_track.dart';
import '../../features/my_profile/model/entity/user.dart';

part 'database.g.dart';

@DriftDatabase(tables: [User, MoodTrack])
class Database extends _$Database {
  Database() : super(_openConnection());

  static const int _databaseVersion = 1;

  @override
  int get schemaVersion => _databaseVersion;
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      return NativeDatabase(
        File(
          p.join(
            (await getApplicationDocumentsDirectory()).path,
            'db.sqlite',
          ),
        ),
        logStatements: true,
      );
    },
  );
}
