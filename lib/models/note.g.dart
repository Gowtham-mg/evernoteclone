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
      fields[5] as Notebook,
      fields[4] as DateTime,
      fields[6] as bool,
      fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.lastSeenDate)
      ..writeByte(5)
      ..write(obj.notebook)
      ..writeByte(6)
      ..write(obj.isDeleted)
      ..writeByte(7)
      ..write(obj.availableOffline);
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
