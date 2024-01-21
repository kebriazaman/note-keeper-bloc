import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_keeper_bloc/bloc/notes_bloc.dart';
import 'package:note_keeper_bloc/bloc/notes_event.dart';
import 'package:note_keeper_bloc/bloc/notes_state.dart';
import 'package:note_keeper_bloc/screens/notes_details_screen.dart';
import 'package:note_keeper_bloc/screens/widgets/notes_card.dart';
import 'package:note_keeper_bloc/utils/database_helper.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});
  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    initDatabase();
    context.read<NotesBloc>().add(FetchNotesEvent());
  }

  void initDatabase() async {
    await databaseHelper.initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes', style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.error:
                return Center(child: Text('Something went wrong'));
              case Status.success:
                return ListView.builder(
                  itemCount: state.notesList.length,
                  itemBuilder: (context, index) {
                    String title = state.notesList[index].title ?? '';
                    String description = state.notesList[index].description ?? '';
                    String date = state.notesList[index].date ?? '';
                    int priority = state.notesList[index].priority ?? 0;
                    return NotesCard(title: title, subtitle: date, bgColor: Colors.red.withOpacity(0.5));
                  },
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () async {
          // await databaseHelper.insertNote(Note('call to malik', 'I have to call mr.malik', '12/2/23', 1));
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NotesDetailsScreen()));
        },
      ),
    );
  }
}
