import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final formattedDate = DateFormat('dd MMM, yyyy').format(date);
  return formattedDate;
}