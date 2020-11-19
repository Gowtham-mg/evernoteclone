import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'notebook.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 2, adapterName: 'NotebookAdapter')
class Notebook extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final int count;
  @HiveField(4)
  final DateTime lastSeenDate;
  @HiveField(5)
  final bool isDeleted;
  @HiveField(6)
  final bool availableOffline;

  Notebook(this.name, this.id, this.date, this.count, this.lastSeenDate,
      this.isDeleted, this.availableOffline);
  Notebook.named(
      {this.count,
      this.lastSeenDate,
      this.isDeleted,
      this.availableOffline,
      this.name,
      this.id,
      this.date});

  Map<String, dynamic> toJson() => _$NotebookToJson(this);

  factory Notebook.fromJson(json) => _$NotebookFromJson(json);
}
