import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/home/model/entity/User.dart';

part 'database.g.dart';

@DriftDatabase(tables: [User])
class Database extends _$Database {
  Database() : super(_openConnection());

  static const int _databaseVersion = 1;

  @override
  int get schemaVersion => _databaseVersion;
}

QueryExecutor _openConnection() {
  const String databaseName = 'harmoni';
  return driftDatabase(
    name: databaseName,
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
    ),
  );
}
