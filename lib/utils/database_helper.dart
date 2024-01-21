import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/notes_model.dart';

class DatabaseHelper {
  Database? _database;
  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';
  String colPriority = 'priority';

  Future<Database> get database async => _database = await initializeDatabase();

  Future<Database> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'note.db');

    Database notesDatabase = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return notesDatabase;
  }

  void _createDatabase(Database database, int newVersion) async {
    await database.execute(
        'CREATE TABLE IF NOT EXISTS $noteTable($colId INTEGER NOT NULL, $colTitle TEXT, $colDescription TEXT, $colDate TEXT, $colPriority INTEGER) PRIMARY KEY($colId AUTOINCREMENT)');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await database;
    var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    return result;
  }

  Future<int> insertNote(Map<String, dynamic> note) async {
    Database db = await database;
    var result = await db.insert(noteTable, note);
    return result;
  }

  Future<int> updateNote(NotesModel note) async {
    Database db = await database;
    var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  Future<int> deleteNote(int id) async {
    Database db = await database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  Future<int?> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> list = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int? result = Sqflite.firstIntValue(list);
    return result;
  }
}
