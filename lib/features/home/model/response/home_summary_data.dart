class HomeSummaryData {
  List<MoodTrackSummary>? moodTracks;
  List<ActivityGroupSummary>? activityGroups;
}

class MoodTrackSummary {
  String? imageMood;
  String? recordMood;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ActivitySummary>? activities;

  MoodTrackSummary({
    this.imageMood,
    this.recordMood,
    this.createdAt,
    this.updatedAt,
    this.activities,
  });

  factory MoodTrackSummary.fromJson(Map<String, dynamic> json) {
    return MoodTrackSummary(
      imageMood: json['imageMood'] as String,
      recordMood: json['recordMood'] as String,
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      activities: List<ActivitySummary>.from(json['activities'].map((activity) => ActivitySummary.fromJson(activity))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageMood': imageMood,
      'recordMood': recordMood,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
      'activities': activities!.map((activity) => activity.toJson()).toList(),
    };
  }
}

class ActivitySummary {
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  ActivitySummary({
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivitySummary.fromJson(Map<String, dynamic> json) {
    return ActivitySummary(
      name: json['name'] as String,
      image: json['image'] as String,
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}

class ActivityGroupSummary {
  String? name;
  String? image;
  List<ActivitySummary>? activities;
  DateTime? createdAt;
  DateTime? updatedAt;

  ActivityGroupSummary({
    this.name,
    this.updatedAt,
    this.createdAt,
    this.image,
    this.activities,
  });

  factory ActivityGroupSummary.fromJson(Map<String, dynamic> json) {
    return ActivityGroupSummary(
      name: json['name'] as String,
      updatedAt: DateTime.tryParse(json['updatedAt']),
      createdAt: DateTime.tryParse(json['createdAt']),
      image: json['image'] as String,
      activities: List<ActivitySummary>.from(json['activities'].map((activity) => ActivitySummary.fromJson(activity))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'updatedAt': updatedAt.toString(),
      'createdAt': createdAt.toString(),
      'image': image,
      'activities': activities!.map((activity) => activity.toJson()).toList(),
    };
  }
}
