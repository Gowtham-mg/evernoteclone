// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return Reminder(
    json['id'],
    json['reminderMarked'] as bool,
    json['markAsCompleted'] as bool,
    json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
  );
}

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      'id': instance.id,
      'reminderMarked': instance.reminderMarked,
      'markAsCompleted': instance.markAsCompleted,
      'dateTime': instance.dateTime?.toIso8601String(),
    };
