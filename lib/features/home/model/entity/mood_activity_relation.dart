import 'package:drift/drift.dart';
import 'package:harmoni/features/home/model/entity/activity.dart';
import 'package:harmoni/features/home/model/entity/mood_track.dart';

class MoodActivityRelationTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get moodTrackId => integer().references(MoodTrackTable, #id, onDelete: KeyAction.cascade)();

  IntColumn get activityId => integer().references(ActivityTable, #id, onDelete: KeyAction.cascade)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
