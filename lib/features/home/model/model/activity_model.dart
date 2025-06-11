class Activity {
  int? id;
  String? name;
  String? image;
  int? color;
  DateTime? createdAt;
  DateTime? updatedAt;

  Activity({
    this.id,
    this.name,
    this.updatedAt,
    this.image,
    this.color,
    this.createdAt,
  });

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['color'] = color;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
