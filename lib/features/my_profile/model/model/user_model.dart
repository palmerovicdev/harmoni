class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? gender;
  int? age;
  String? avatar;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.gender,
    this.age,
    this.avatar,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    age = json['age'];
    avatar = json['avatar'];
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
    return data;
  }
}
