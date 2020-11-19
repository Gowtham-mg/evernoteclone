// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notebook.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotebookAdapter extends TypeAdapter<Notebook> {
  @override
  final int typeId = 2;

  @override
  Notebook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notebook(
      fields[0] as String,
      fields[1] as String,
      fields[2] as DateTime,
      fields[3] as int,
      fields[4] as DateTime,
      fields[5] as bool,
      fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Notebook obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.lastSeenDate)
      ..writeByte(5)
      ..write(obj.isDeleted)
      ..writeByte(6)
      ..write(obj.availableOffline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotebookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notebook _$NotebookFromJson(Map<String, dynamic> json) {
  return Notebook(
    json['name'] as String,
    json['id'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    json['count'] as int,
    json['lastSeenDate'] == null
        ? null
        : DateTime.parse(json['lastSeenDate'] as String),
    json['isDeleted'] as bool,
    json['availableOffline'] as bool,
  );
}

Map<String, dynamic> _$NotebookToJson(Notebook instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'count': instance.count,
      'lastSeenDate': instance.lastSeenDate?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'availableOffline': instance.availableOffline,
    };
