import 'package:drift/drift.dart';
import 'package:harmoni/core/helpers/database.dart';
import 'package:harmoni/core/service_locator/service_locator.dart';
import 'package:harmoni/features/my_profile/model/entity/user.dart';

class MyProfileService {
  static UserInfo userProfile = UserInfo();

  init() async {
    var db = getDatabaseService();
    await initializeUserFromDb(db);
  }

  Future<void> initializeUserFromDb(Database db) async {
    if (await db.user.count().getSingle() == 0) return;

    var data = await db.user.all().get();
    var singleUser = data.first;
    userProfile = UserInfo(
      id: singleUser.id,
      name: singleUser.name,
      email: singleUser.email,
      password: singleUser.password,
      gender: singleUser.gender,
      age: singleUser.age,
      avatar: singleUser.avatar,
    );
  }
}
