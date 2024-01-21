import 'package:equatable/equatable.dart';

class NotesModel extends Equatable {
  int? id;
  String? title;
  String? description;
  String? date;
  int? priority;

  NotesModel(this.title, this.description, this.date, this.priority);

  NotesModel copyWith({String? title, String? description, String? date, int? priority}) {
    return NotesModel(
      title ?? this.title,
      description ?? this.description,
      date ?? this.date,
      priority ?? this.priority,
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['date'] = date;
    map['priority'] = priority;
    return map;
  }

  NotesModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    date = map['date'];
    priority = map['priority'];
  }

  @override
  List<Object?> get props => [title, description, date, priority];
}
