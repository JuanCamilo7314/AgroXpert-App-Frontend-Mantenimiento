import 'package:intl/intl.dart';

String dateOnly(DateTime date) {
  date = DateTime(date.year, date.month, date.day);
  String formattedDate = DateFormat('dd/MM/yyyy').format(date);
  return formattedDate;
}
