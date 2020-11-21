import 'package:json_annotation/json_annotation.dart';
part 'feature.g.dart';

@JsonSerializable()
class Feature {
  final String id;
  final String feature;
  final bool isEligible;
  final String icon;
  final int limit;

  Feature(this.id, this.feature, this.isEligible, this.icon, this.limit);
  Feature.named(
      {this.id, this.feature, this.isEligible, this.icon, this.limit});
  Feature copyWith(
      {String id, String feature, bool isEligible, String icon, int limit}) {
    return Feature.named(
        id: id ?? this.id,
        feature: feature ?? this.feature,
        isEligible: isEligible ?? this.isEligible,
        icon: icon ?? this.icon,
        limit: limit ?? this.limit);
  }

  Map<String, dynamic> toJson() => _$FeatureToJson(this);

  factory Feature.fromJson(json) => _$FeatureFromJson(json);

}
