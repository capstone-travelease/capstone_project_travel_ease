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
    return this == null ? '' : DateFormat('HH:mm dd/MM/yyyy').format(this!);
  }

  String formatDateToString() {
    return this == null
        ? ''
        : DateFormat('EE, dd/MM/yyyy', 'vi_VN').format(this!);
  }

  String formatDateTimeToString() {
    return this == null ? '' : DateFormat('EE, d MMM y', 'vi_VN').format(this!);
  }
}
