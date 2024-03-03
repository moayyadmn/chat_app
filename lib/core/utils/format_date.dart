import 'package:intl/intl.dart';

class FormatDate {
  static String formattedDate(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    String date = DateFormat('MMM d, h:mm a').format(dateTime).toString();
    return date;
  }
}
