import 'package:drift/drift.dart';

class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get email => text()();

  TextColumn get password => text()();

  TextColumn get gender => text()();

  IntColumn get age => integer()();

  TextColumn get avatar => text()();
}