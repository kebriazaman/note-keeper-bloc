import 'package:flutter/material.dart';
import 'package:note_keeper_bloc/screens/notes_details_screen.dart';

void main() {
  runApp(const NoteKeeper());
}

class NoteKeeper extends StatelessWidget {
  const NoteKeeper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesDetailsScreen(),
    );
  }
}
