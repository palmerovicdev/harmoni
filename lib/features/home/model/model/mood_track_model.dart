class MoodTrack {
  String? imageMood;
  String? recordMood;
  DateTime? createdAt;
  DateTime? updatedAt;

  MoodTrack({
    this.createdAt,
    this.imageMood,
    this.recordMood,
    this.updatedAt,
  });

  factory MoodTrack.fromJson(Map<String, dynamic> json) {
    return MoodTrack(
      imageMood: json['imageMood'] ?? '',
      recordMood: json['emotionType'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageMood': imageMood,
      'recordMood': recordMood,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
