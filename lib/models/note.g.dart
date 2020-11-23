// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = 1;

  @override
  Note read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Note(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as DateTime,
      fields[5] as String,
      fields[4] as DateTime,
      fields[6] as bool,
      fields[7] as bool,
      (fields[8] as List)?.cast<String>(),
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.notebookId)
      ..writeByte(6)
      ..write(obj.isDeleted)
      ..writeByte(7)
      ..write(obj.availableOffline)
      ..writeByte(8)
      ..write(obj.tags)
      ..writeByte(9)
      ..write(obj.reminderId)
      ..writeByte(10)
      ..write(obj.location)
      ..writeByte(11)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    json['id'] as String,
    json['title'] as String,
    json['content'] as String,
    json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    json['notebookId'] as String,
    json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    json['isDeleted'] as bool,
    json['availableOffline'] as bool,
    (json['tags'] as List)?.map((e) => e as String)?.toList(),
    json['reminderId'] as String,
    json['location'] as String,
    json['userId'] as String,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'notebookId': instance.notebookId,
      'isDeleted': instance.isDeleted,
      'availableOffline': instance.availableOffline,
      'tags': instance.tags,
      'reminderId': instance.reminderId,
      'location': instance.location,
      'userId': instance.userId,
    };
