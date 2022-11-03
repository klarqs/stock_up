String timeAgo(DateTime fatchedDate) {
  DateTime currentDate = DateTime.now();

  var different = currentDate.difference(fatchedDate);

  if (different.inDays > 365) {
    return "${(different.inDays / 365).floor()}${(different.inDays / 365).floor() == 1 ? "Y" : "Y"}";
  }
  if (different.inDays > 30) {
    return "${(different.inDays / 30).floor()}${(different.inDays / 30).floor() == 1 ? "M" : "M"}";
  }
  if (different.inDays > 7) {
    return "${(different.inDays / 7).floor()}${(different.inDays / 7).floor() == 1 ? "W" : "W"}";
  }
  if (different.inDays > 0) {
    return "${different.inDays}${different.inDays == 1 ? "D" : "D"}";
  }
  if (different.inHours > 0) {
    return "${different.inHours}${different.inHours == 1 ? "H" : "H"}";
  }
  if (different.inMinutes > 0) {
    return "${different.inMinutes}${different.inMinutes == 1 ? "M" : "M"}";
  }
  if (different.inMinutes == 0) return 'Now';

  return fatchedDate.toString();
}
