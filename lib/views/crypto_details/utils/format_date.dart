import 'package:intl/intl.dart';

String formatDate(int timestamp) {
  final dateFormat = DateFormat("dd/MM/yyyy");

  final convertedTimestamp =
      DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);

  final formattedDate = dateFormat.format(convertedTimestamp);

  return formattedDate;
}
