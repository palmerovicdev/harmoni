import 'package:drift/drift.dart';
import 'package:harmoni/features/my_profile/model/entity/user.dart';

class MoodTrackTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().references(UserTable, #id, onDelete: KeyAction.cascade)();

  TextColumn get imageMood => text()();

  TextColumn get recordMood => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
