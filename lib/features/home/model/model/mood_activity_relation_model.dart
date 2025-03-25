class MoodActivityRelation {
  int? id;
  int? moodTrackId;
  int? activityId;
  DateTime? createdAt;
  DateTime? updatedAt;

  MoodActivityRelation({
    this.id,
    this.moodTrackId,
    this.activityId,
    this.createdAt,
    this.updatedAt,
  });

  MoodActivityRelation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moodTrackId = json['mood_track_id'];
    activityId = json['activity_id'];
    createdAt = json['create_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mood_track_id'] = moodTrackId;
    data['activity_id'] = activityId;
    data['create_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
