import 'package:note_keeper_bloc/utils/database_helper.dart';

import '../models/notes_model.dart';

class NotesRepository {
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<List<NotesModel>> getNotesList() async {
    var notesList = await databaseHelper.getNoteMapList();
    List<NotesModel> notes = notesList.map((e) => NotesModel.fromMap(e)).toList();
    return notes;
  }

  Future<int> insertNote(NotesModel note) async {
    int r = await databaseHelper.insertNote(note.toMap());
    return r;
  }
}
