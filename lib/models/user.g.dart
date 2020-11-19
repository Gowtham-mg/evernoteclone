// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as int,
      fields[7] as String,
      fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.profilePic)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.noOfDevicesLoggedIn)
      ..writeByte(7)
      ..write(obj.token)
      ..writeByte(8)
      ..write(obj.isPremiumUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      'noOfDevicesLoggedIn': instance.noOfDevicesLoggedIn,
      'token': instance.token,
      'isPremiumUser': instance.isPremiumUser,
    };
