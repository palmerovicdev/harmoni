class Activity {
  int? id;
  String? name;
  String? image;
  int? activityGroupId;
  DateTime? createAt;
  DateTime? updatedAt;

  Activity({
    this.id,
    this.name,
    this.updatedAt,
    this.image,
    this.activityGroupId,
    this.createAt,
  });

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    activityGroupId = json['activity_group_id'];
    createAt = json['create_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['activity_group_id'] = activityGroupId;
    data['create_at'] = createAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
