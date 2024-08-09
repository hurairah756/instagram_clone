import 'constant_strings.dart';

String formatTimeDifference(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays > 0) {
    return '${difference.inDays} ${ConstantStrings.DAYS_AGO}';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${ConstantStrings.H_HOURS_AGO}';
  } else {
    return '${difference.inMinutes} ${ConstantStrings.MINUTES_AGO}';
  }
}
