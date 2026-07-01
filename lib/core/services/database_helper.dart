import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../auth/data/models/user_model.dart';

class DatabaseHelper {
  // Singleton pattern — only ONE instance of DatabaseHelper ever exists
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() => instance;
  DatabaseHelper._internal();

  // The actual database object
  static Database? _database;

  // Getter — if DB already open, return it. Otherwise open it.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Opens (or creates) the database file on the device
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath(); // finds the right folder on device
    final path = join(dbPath, 'betrhealth.db'); // full path to the .db file

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTable, // runs only the very first time app is installed
    );
  }

  // Creates the users table — runs once on first launch
  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');
  }

  // INSERT a new user (called on Signup)
  Future<bool> insertUser(UserModel user) async {
    final db = await database;
    try {
      await db.insert(
        'users',
        user.toMap(),
        conflictAlgorithm:
            ConflictAlgorithm.abort, // fails if email already exists
      );
      return true;
    } catch (e) {
      return false; // email already exists (UNIQUE constraint failed)
    }
  }

  // QUERY — find user by email and password (called on Login)
  Future<UserModel?> getUser(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first); // found → return user
    }
    return null; // not found → return null
  }

  // CHECK — does this email already exist? (useful in Signup validation)
  Future<bool> emailExists(String email) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }
}
