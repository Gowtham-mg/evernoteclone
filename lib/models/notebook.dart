import 'package:json_annotation/json_annotation.dart';

part 'notebook.g.dart';

@JsonSerializable(explicitToJson: true)
class Notebook {
  final String name;
  final String id;
  final DateTime date;
  final int count;
  final DateTime lastSeenDate;
  final bool isDeleted;
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
