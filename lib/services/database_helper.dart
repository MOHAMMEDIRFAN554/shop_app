import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "MyntraDB.db";
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            password TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE product (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            description TEXT,
            price REAL NOT NULL,
            image TEXT NOT NULL,
            isExclusive INTEGER NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE orders (
            id INTEGER PRIMARY KEY,
            productId INTEGER,
            quantity INTEGER,
            totalPrice REAL,
            date TEXT,
            FOREIGN KEY (productId) REFERENCES product (id)
          )
          ''');
  }
}
