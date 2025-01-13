import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

import '../../features/home/model/entity/user.dart';

part 'database.g.dart';

@DriftDatabase(tables: [User])
class Database extends _$Database {
  Database() : super(_openConnection());

  static const int _databaseVersion = 1;

  @override
  int get schemaVersion => _databaseVersion;
}

QueryExecutor _openConnection() {
  return PgDatabase(
    endpoint: pg.Endpoint(
      host: 'localhost',
      database: 'harmoni',
      username: 'postgres',
      password: 'postgres',
    ),
  );
}
