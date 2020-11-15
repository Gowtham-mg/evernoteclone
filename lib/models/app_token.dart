import 'package:json_annotation/json_annotation.dart';

part 'app_token.g.dart';

@JsonSerializable(explicitToJson: true)
class AppToken {
  final String token;
  final String userId;

  AppToken(this.token, this.userId);

  AppToken.named({
    this.token,
    this.userId,
  });

  Map<String, dynamic> toJson() => _$AppTokenToJson(this);

  factory AppToken.fromJson(json) => _$AppTokenFromJson(json);
}
