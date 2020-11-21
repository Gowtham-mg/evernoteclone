import 'package:json_annotation/json_annotation.dart';

part 'reminder.g.dart';
@JsonSerializable()
class Reminder {
  final id;
  final bool reminderMarked;
  final bool markAsCompleted;
  final DateTime dateTime;

  Reminder(this.id, this.reminderMarked, this.markAsCompleted, this.dateTime);
  Reminder.named(
      {this.id, this.reminderMarked, this.markAsCompleted, this.dateTime});

  Reminder copyWith(
      {String id,
      bool reminderMarked,
      bool markAsCompleted,
      DateTime dateTime}) {
    return Reminder.named(
        id: id ?? this.id,
        reminderMarked: reminderMarked ?? this.reminderMarked,
        markAsCompleted: markAsCompleted ?? this.markAsCompleted,
        dateTime: dateTime ?? this.dateTime);
  }

  Map<String, dynamic> toJson() => _$ReminderToJson(this);
  factory Reminder.fromJson(json) => _$ReminderFromJson(json);

}