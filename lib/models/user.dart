import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum SubscriptionStatus {
  basic,
  premium
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "fullName")
  final String name;
  @JsonKey(name: "avatar")
  final String profilePic;
  final String email;
  final String password;
  final String phone;
  final SubscriptionStatus subscriptionStatus;
  

  User(this.id, this.name, this.profilePic, this.email, this.password,
      this.phone, this.subscriptionStatus);
  User.named(
      {this.id,
      this.name,
      this.profilePic,
      this.email,
      this.password,
      this.subscriptionStatus, 
      this.phone});

  User copyWith(
      {String id,
      String name,
      String profilePic,
      String email,
      String password,
      SubscriptionStatus subscriptionStatus,
      String phone}) {
    return User.named(
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        profilePic: profilePic ?? this.profilePic,
        subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus
      );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(json) => _$UserFromJson(json);
}
