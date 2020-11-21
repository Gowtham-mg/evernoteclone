
import 'package:json_annotation/json_annotation.dart';

part 'plan.g.dart';
@JsonSerializable()
class Plan{
  final String id;
  final String name;
  final List<String> feature;

  Plan(this.id, this.name, this.feature);
  Plan.named({this.id, this.name, this.feature});
  Plan copyWith({String id, String name, List<String> feature}){
    return Plan.named(id: id ?? this.id, name: name ?? this.name, feature: feature ?? this.feature);
  }

    Map<String, dynamic> toJson() => _$PlanToJson(this);

  factory Plan.fromJson(json) => _$PlanFromJson(json);
}