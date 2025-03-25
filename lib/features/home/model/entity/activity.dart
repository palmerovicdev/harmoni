import 'package:drift/drift.dart';
import 'package:harmoni/features/home/model/entity/activity_group.dart';

class ActivityTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get image => text()();

  IntColumn get activityGroupId => integer().references(ActivityGroupTable, #id, onDelete: KeyAction.cascade)();

  DateTimeColumn get createdAt => dateTime().generatedAs(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().generatedAs(currentDateAndTime)();
}
