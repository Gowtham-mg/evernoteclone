// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notebook.dart';

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
