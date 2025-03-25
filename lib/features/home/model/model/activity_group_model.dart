

class ActivityGroup {
  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  ActivityGroup({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivityGroup.fromJson(Map<String, dynamic> json) {
    return ActivityGroup(
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
