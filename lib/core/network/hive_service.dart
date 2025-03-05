import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wise_academy/app/constants/hive_table_constant.dart';
import 'package:wise_academy/features/auth/data/model/auth_hive_model.dart';

class HiveService {
  /// **📌 Initialize Hive Database**
  static Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}/e_learning.db';

    Hive.init(path);

    // ✅ Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // 🔹 **USER AUTHENTICATION OPERATIONS**

  /// **📌 Register User**
  Future<void> register(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.studentId, auth);
  }

  /// **📌 Delete User by ID**
  Future<void> deleteAuth(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  /// **📌 Get All Users**
  Future<List<AuthHiveModel>> getAllAuth() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    return box.values.toList();
  }

  /// **📌 Login User**
  Future<AuthHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    try {
      return box.values.firstWhere(
        (element) => element.email == email && element.password == password,
      );
    } catch (e) {
      return null; // Return null if no user is found
    }
  }

  // 🔹 **UTILITY FUNCTIONS**

  /// **📌 Clear All User Data**
  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  /// **📌 Close Hive Database**
  Future<void> close() async {
    await Hive.close();
  }
}
