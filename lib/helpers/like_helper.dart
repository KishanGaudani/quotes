import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? db;

class LikeDBHelper {
  LikeDBHelper._();

  static final LikeDBHelper likeDBHelper = LikeDBHelper._();

  Future<Database?> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'qoute_database.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE quote (quote TEXT, BGNum int);');
    });

    return db!;
  }

  Future<int> insertData({required String quote, required int BGImage}) async {
    db = await initDB();

    String query = "INSERT INTO quote (quote, BGNum) VALUES(?, ?);";

    List args = [quote, BGImage];

    return await db!.rawInsert(query, args);
  }
}
