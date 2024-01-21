import 'package:equatable/equatable.dart';
import 'package:note_keeper_bloc/models/notes_model.dart';

enum Status { loading, success, error }

class NotesState extends Equatable {
  final List<NotesModel> notesList;
  final Status status;
  const NotesState({
    this.notesList = const [],
    this.status = Status.loading,
  });

  NotesState copyWith({List<NotesModel>? notesList, Status? status}) {
    return NotesState(
      notesList: notesList ?? this.notesList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [notesList, status];
}
