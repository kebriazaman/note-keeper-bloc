import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({required this.title, required this.subtitle, required this.bgColor, super.key});

  final String title, subtitle;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 0.0,
        leading: CircleAvatar(child: Icon(Icons.play_arrow), backgroundColor: bgColor),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        trailing: const Icon(Icons.delete),
      ),
    );
  }
}
