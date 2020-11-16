import 'notebook.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable(explicitToJson: true)
class Note {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final DateTime lastSeenDate;
  final Notebook notebook;
  final bool isDeleted;
  final bool availableOffline;

  Note(this.id, this.title, this.content, this.date, this.notebook,
      this.lastSeenDate, this.isDeleted, this.availableOffline);
  Note.named(
      {this.lastSeenDate,
      this.isDeleted,
      this.availableOffline,
      this.id,
      this.title,
      this.content,
      this.date,
      this.notebook});

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  factory Note.fromJson(json) => _$NoteFromJson(json);
}
