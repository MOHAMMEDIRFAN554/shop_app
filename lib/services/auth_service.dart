import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
import '../models/user.dart';

class AuthService {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  Future<int> registerUser(User user) async {
    final Database db = await dbHelper.database;
    var res = await db.insert('user', {
      'name': user.name,
      'email': user.email,
      'password': user.password,
    });
    return res;
  }

  Future<User?> loginUser(String email, String password) async {
    final Database db = await dbHelper.database;
    var res = await db.rawQuery(
        "SELECT * FROM user WHERE email = ? AND password = ?",
        [email, password]);
    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }
}
