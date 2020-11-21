// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feature _$FeatureFromJson(Map<String, dynamic> json) {
  return Feature(
    json['id'] as String,
    json['feature'] as String,
    json['isEligible'] as bool,
    json['icon'] as String,
    json['limit'] as int,
  );
}

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'id': instance.id,
      'feature': instance.feature,
      'isEligible': instance.isEligible,
      'icon': instance.icon,
      'limit': instance.limit,
    };
