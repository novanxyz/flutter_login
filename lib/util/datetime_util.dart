import 'package:intl/intl.dart';

class DatetimeUtil {
  /// Format [dateTime] to formatted date
  static String formatDate(DateTime dateTime) {
    return DateFormat('EEEE d MMMM y, HH:mm', 'id').format(dateTime.toLocal());
  }
  static String getDateDiffInMinute (DateTime start, DateTime end){
    return 'durasi : ${end.difference(start).inMinutes.toString()} menit';
  }

  static String formatDateOnlyTime(DateTime dateTime) {
    return DateFormat('HH:mm', 'id').format(dateTime.toLocal());
  }
}
