// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppToken _$AppTokenFromJson(Map<String, dynamic> json) {
  return AppToken(
    json['token'] as String,
    json['userId'] as String,
  );
}

Map<String, dynamic> _$AppTokenToJson(AppToken instance) => <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
    };
