class DateTimeHelper {
  static const List<String> month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static const List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  static String getAmOrPm(int hour, int minute) {
    String amOrPm = hour < 12 ? 'am' : 'pm';
    hour = hour > 12 ? hour - 12 : hour;
    String hr = hour < 10 ? '0$hour' : '$hour';
    String min = minute < 10 ? '0$minute' : '$minute';
    return '$hr:$min $amOrPm';
  }

  static String getFullMonthAsString(DateTime date) {
    return month[date.month];
  }

  static String getWeekDayString(int weekDay) {
    return weekDays[weekDay].substring(0, 3);
  }

  static String getAllNotePeriod(DateTime date) {
    return '${getFullMonthAsString(date)} ${date.year}';
  }

  static String getAllNoteSubPeriod(DateTime date) {
    return '${date.day}/${getFullMonthAsString(date)}/${date.year}';
  }
}
