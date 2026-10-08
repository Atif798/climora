import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  // "Mon, 25 Sep"
  static String fullDate(DateTime date) {
    return DateFormat('EEE, d MMM').format(date);
  }

  // "Mon"
  static String dayShort(DateTime date) {
    return DateFormat('EEE').format(date);
  }

  // "25 Sep"
  static String dateShort(DateTime date) {
    return DateFormat('d MMM').format(date);
  }

  // "Today" or "Mon"
  static String dayLabel(DateTime date) {
    return isToday(date) ? 'Today' : dayShort(date);
  }

  // "Monday, 25 September 2026"
  static String fullLong(DateTime date) {
    return DateFormat('EEEE, d MMMM yyyy').format(date);
  }

  // Check if date is today
  static bool isToday(DateTime date) {
    final today = DateTime.now();
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }

  // "10:30 AM"
  static String time(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }
}