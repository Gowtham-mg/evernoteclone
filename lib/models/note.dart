import 'notebook.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'note.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1, adapterName: 'NoteAdapter')
class Note extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final DateTime lastSeenDate;
  @HiveField(5)
  final Notebook notebook;
  @HiveField(6)
  final bool isDeleted;
  @HiveField(7)
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
