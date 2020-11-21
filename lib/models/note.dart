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
  final DateTime createdAt;
  @HiveField(4)
  final DateTime updatedAt;
  @HiveField(5)
  final String notebookId;
  @HiveField(6)
  final bool isDeleted;
  @HiveField(7)
  final bool availableOffline;
  @HiveField(8)
  final List<String> tags;
  @HiveField(9)
  final String reminderId;
  @HiveField(10)
  final String location;

  Note(
      this.id,
      this.title,
      this.content,
      this.createdAt,
      this.notebookId,
      this.updatedAt,
      this.isDeleted,
      this.availableOffline,
      this.tags,
      this.reminderId,
      this.location);
  Note.named(
      {this.updatedAt,
      this.location,
      this.reminderId,
      this.tags,
      this.isDeleted,
      this.availableOffline,
      this.id,
      this.title,
      this.content,
      this.createdAt,
      this.notebookId});

  Note copyWith(
      {List<String> tags,
      DateTime createdAt,
      DateTime updatedAt,
      String notebookId,
      String location,
      String id,
      String title,
      String content,
      String reminderId}) {
    return Note.named(
        tags: tags ?? this.tags,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        notebookId: notebookId ?? this.notebookId,
        location: location ?? this.location,
        id: id ?? this.id,
        title: title ?? this.title,
        availableOffline: availableOffline ?? this.availableOffline,
        isDeleted: isDeleted ?? this.isDeleted,
        content: content ?? this.content,
        reminderId: reminderId ?? this.reminderId);
  }

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  factory Note.fromJson(json) => _$NoteFromJson(json);
}
