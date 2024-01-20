import 'package:flutter/material.dart';
import 'package:note_keeper_bloc/screens/widgets/notes_card.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes', style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return NotesCard(title: 'Book Flight', subtitle: '1/12/24', bgColor: Colors.red.withOpacity(0.5));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
