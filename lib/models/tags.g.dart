// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    json['id'] as String,
    json['name'] as String,
    json['count'] as int,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
    };
