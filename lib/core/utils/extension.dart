import 'package:intl/intl.dart';

extension Validation on String? {
  String? checkEmpty(String message) {
    if (this?.isEmpty ?? true) {
      return message;
    }
    return null;
  }
}

extension FormatDateTime on DateTime? {
  String formatDateAndTimeToString() {
    return this == null ? '' : DateFormat('dd/MM/yyyy').format(this!);
  }

  String formatDateToString() {
    return this == null
        ? ''
        : DateFormat('EE, dd/MM/yyyy', 'vi_VN').format(this!);
  }

  String formatDateMonthToString() {
    return this == null ? '' : DateFormat('EE, d MMM y', 'vi_VN').format(this!);
  }
}

extension DateTimeExt on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Returns a new [DateTime] instance with the time set to 00:00:00.000.
  DateTime toStartOfDay() {
    return DateTime(year, month, day);
  }
}
