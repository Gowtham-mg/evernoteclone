// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['fullName'] as String,
    json['avatar'] as String,
    json['email'] as String,
    json['password'] as String,
    json['phone'] as String,
    _$enumDecodeNullable(
        _$SubscriptionStatusEnumMap, json['subscriptionStatus']),
    json['noOfDevicesLoggedIn'] as int,
    json['token'] as String,
    json['isPremiumUser'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.name,
      'avatar': instance.profilePic,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'subscriptionStatus':
          _$SubscriptionStatusEnumMap[instance.subscriptionStatus],
      'noOfDevicesLoggedIn': instance.noOfDevicesLoggedIn,
      'token': instance.token,
      'isPremiumUser': instance.isPremiumUser,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.basic: 'basic',
  SubscriptionStatus.premium: 'premium',
};
