import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:harmoni/core/helpers/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../features/home/model/entity/activity.dart';
import '../../features/home/model/entity/activity_group.dart';
import '../../features/home/model/entity/mood_activity_relation.dart';
import '../../features/home/model/entity/mood_track.dart';
import '../../features/my_profile/model/entity/user.dart';

part 'database.g.dart';

@DriftDatabase(tables: [UserTable, MoodTrackTable, ActivityTable, ActivityGroupTable, MoodActivityRelationTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  static const int _databaseVersion = 1;

  @override
  int get schemaVersion => _databaseVersion;
}

Future<void> deleteDb() async {
  final dbFile = File(
    p.join(
      (await getApplicationDocumentsDirectory()).path,
      'db.sqlite',
    ),
  );
  if (await dbFile.exists()) {
    await dbFile.delete();
    logI("🔥 Base de datos eliminada");
  }
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
