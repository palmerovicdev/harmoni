import 'package:drift/drift.dart';

class MoodTrack extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer()();

  TextColumn get imageMood => text()();

  TextColumn get recordMood => text()();

  DateTimeColumn get createAt => dateTime().generatedAs(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().generatedAs(currentDateAndTime)();
}

class MoodTrackInfo {
  int? id;
  int? userId;
  String? imageMood;
  String? recordMood;
  DateTime? createdAt;
  DateTime? updatedAt;

  MoodTrackInfo({
    this.id,
    this.userId,
    this.createdAt,
    this.imageMood,
    this.recordMood,
    this.updatedAt,
  });

  factory MoodTrackInfo.fromJson(Map<String, dynamic> json) {
    return MoodTrackInfo(
      id: json['id'] as int,
      userId: json['userId'] as int,
      imageMood: json['imageMood'] as String,
      recordMood: json['recordMood'] as String,
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'imageMood': imageMood,
      'recordMood': recordMood,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
