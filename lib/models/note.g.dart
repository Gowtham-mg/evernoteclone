// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    json['id'] as String,
    json['title'] as String,
    json['content'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    json['notebook'] == null ? null : Notebook.fromJson(json['notebook']),
    json['lastSeenDate'] == null
        ? null
        : DateTime.parse(json['lastSeenDate'] as String),
    json['isDeleted'] as bool,
    json['availableOffline'] as bool,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'date': instance.date?.toIso8601String(),
      'lastSeenDate': instance.lastSeenDate?.toIso8601String(),
      'notebook': instance.notebook?.toJson(),
      'isDeleted': instance.isDeleted,
      'availableOffline': instance.availableOffline,
    };
