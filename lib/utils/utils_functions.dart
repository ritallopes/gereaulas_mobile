int differenceBetweenDate(DateTime d1, DateTime d2) {
  return DateTime(d2.year, d2.month, d2.day)
      .difference(DateTime(d1.year, d1.month, d1.day))
      .inDays;
}
