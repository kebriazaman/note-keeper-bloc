import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_keeper_bloc/bloc/notes_bloc.dart';
import 'package:note_keeper_bloc/repository/notes_repository.dart';
import 'package:note_keeper_bloc/screens/note_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NoteKeeper());
}

class NoteKeeper extends StatelessWidget {
  const NoteKeeper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc(NotesRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NoteListScreen(),
      ),
    );
  }
}
