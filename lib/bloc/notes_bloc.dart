import 'package:bloc/bloc.dart';
import 'package:note_keeper_bloc/bloc/notes_event.dart';
import 'package:note_keeper_bloc/bloc/notes_state.dart';
import 'package:note_keeper_bloc/models/notes_model.dart';

import '../repository/notes_repository.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  List<NotesModel> notesList = [];
  NotesRepository notesRepository;

  NotesBloc(this.notesRepository) : super(NotesState()) {
    on<FetchNotesEvent>((event, emit) async {
      notesList = await notesRepository.getNotesList();
      emit(state.copyWith(notesList: notesList, status: Status.success));
    });
  }
}
