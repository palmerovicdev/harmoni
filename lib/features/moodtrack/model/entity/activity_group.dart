import 'package:drift/drift.dart';

class ActivityGroup extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get image => text()();

  DateTimeColumn get createAt => dateTime().generatedAs(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().generatedAs(currentDateAndTime)();
}

class ActivityGroupInfo {
  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  ActivityGroupInfo({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivityGroupInfo.fromJson(Map<String, dynamic> json) {
    return ActivityGroupInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
