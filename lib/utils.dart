import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toShortDateString() {
    return DateFormat('MM/dd/yyyy').format(this);
  }
}
