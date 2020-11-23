import 'package:json_annotation/json_annotation.dart';

part 'tags.g.dart';

@JsonSerializable()
class Tag {
  final String id;
  final String name;
  final int count;

  Tag(this.id, this.name, this.count);
  Tag.named({this.id, this.name, this.count});
  Tag copyWith({String id, String name, int count}) {
    return Tag.named(
        count: count ?? this.count, id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);

  factory Tag.fromJson(json) => _$TagFromJson(json);
}
