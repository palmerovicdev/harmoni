class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? gender;
  int? age;
  String? avatar;
  Map<String, dynamic>? settings;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.gender,
    this.age,
    this.avatar,
    this.settings,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    age = json['age'];
    avatar = json['avatar'];
    settings = json['settings'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['gender'] = gender;
    data['age'] = age;
    data['avatar'] = avatar;
    data['settings'] = settings;
    data['createdAt'] = createdAt.toString();
    data['updatedAt'] = updatedAt.toString();
    return data;
  }
}
