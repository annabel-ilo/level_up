import 'package:intl/intl.dart';

class Util {
  static String apiId = "c2ca7eb0a659f60abdda479cf6e5ef2f";

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat("EEEE , MMM d , y ,").format(dateTime);
  }
}
