import 'package:drift/src/runtime/data_class.dart';
import 'package:harmoni/core/helpers/database.dart';

class Activity {
  int? id;
  String? name;
  String? image;
  int? activityGroupId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Activity({
    this.id,
    this.name,
    this.updatedAt,
    this.image,
    this.activityGroupId,
    this.createdAt,
  });

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    activityGroupId = json['activity_group_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['activity_group_id'] = activityGroupId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

}
