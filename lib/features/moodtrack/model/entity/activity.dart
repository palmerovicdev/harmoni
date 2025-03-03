import 'package:drift/drift.dart';

class Activity extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get image => text()();

  IntColumn get activityGroupId => integer()();

  DateTimeColumn get createAt => dateTime().generatedAs(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().generatedAs(currentDateAndTime)();
}

class ActivityInfo {
  int? id;
  String? name;
  String? image;
  int? activityGroupId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ActivityInfo({
    this.id,
    this.name,
    this.image,
    this.activityGroupId,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivityInfo.fromJson(Map<String, dynamic> json) {
    return ActivityInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      activityGroupId: json['activityGroupId'] as int,
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'activityGroupId': activityGroupId,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}