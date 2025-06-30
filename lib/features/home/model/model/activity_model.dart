import 'package:flutter/material.dart';

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
    name = json['name'];
    image = json['image'];
    color = int.tryParse(json['color']) ?? Colors.transparent.value;
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Activity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
