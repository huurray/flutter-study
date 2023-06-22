import 'package:intl/intl.dart';

String compactNumber(int number) {
  final format = NumberFormat.compact();
  return format.format(number);
}

String formatDate(String isoString) {
  final dateTime = DateTime.parse(isoString);
  final formatter = DateFormat('yyyy.MM.dd');
  return formatter.format(dateTime);
}

String formatTimeAgo(String isoString) {
  final now = DateTime.now();
  final time = DateTime.parse(isoString);
  final difference = now.difference(time);

  if (difference.inMinutes < 1) {
    return 'now';
  } else if (difference.inMinutes < 60) {
    final minutes = difference.inMinutes;
    return '$minutes minute${minutes > 1 ? "s" : ""} ago';
  } else if (difference.inHours < 24) {
    final hours = difference.inHours;
    return '$hours hour${hours > 1 ? "s" : ""} ago';
  } else if (difference.inDays < 30) {
    final days = difference.inDays;
    return '$days day${days > 1 ? "s" : ""} ago';
  } else {
    return formatDate(isoString);
  }
}
