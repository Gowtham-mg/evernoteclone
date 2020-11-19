import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'user.g.dart';

@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'UserAdapter')
class User extends HiveObject {
  @JsonKey(name: "id")
  @HiveField(0)
  final String id;
  @JsonKey(name: "fullName")
  @HiveField(1)
  final String name;
  @HiveField(2)
  @JsonKey(name: "avatar")
  final String profilePic;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final String phone;
  @HiveField(6)
  final int noOfDevicesLoggedIn;
  @HiveField(7)
  final String token;
  @HiveField(8)
  final bool isPremiumUser;

  User(this.id, this.name, this.profilePic, this.email, this.password,
      this.phone, this.noOfDevicesLoggedIn, this.token, this.isPremiumUser);
  User.named(
      {this.id,
      this.isPremiumUser,
      this.noOfDevicesLoggedIn,
      this.token,
      this.name,
      this.profilePic,
      this.email,
      this.password,
      this.phone});

  User copyWith(
      {String id,
      String name,
      String profilePic,
      String email,
      String password,
      int noOfDevicesLoggedIn,
      String token,
      bool isPremiumUser,
      String phone}) {
    return User.named(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      profilePic: profilePic ?? this.profilePic,
      noOfDevicesLoggedIn: noOfDevicesLoggedIn ?? this.noOfDevicesLoggedIn,
      token: token ?? this.token,
      isPremiumUser: isPremiumUser ?? this.isPremiumUser,
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(json) => _$UserFromJson(json);
}
