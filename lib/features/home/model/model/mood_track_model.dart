import 'package:drift/drift.dart';
import 'package:harmoni/features/my_profile/model/entity/user.dart';

class MoodTrack{
  int? id;
  int? userId;
  String? imageMood;
  String? recordMood;
  DateTime? createdAt;
  DateTime? updatedAt;

  MoodTrack({
    this.id,
    this.userId,
    this.createdAt,
    this.imageMood,
    this.recordMood,
    this.updatedAt,
  });

  factory MoodTrack.fromJson(Map<String, dynamic> json) {
    return MoodTrack(
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