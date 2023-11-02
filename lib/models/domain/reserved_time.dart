class ReservedTime {
  DateTime start;
  DateTime end;

  ReservedTime({required this.start, required this.end});
  @override
  String toString() {
    return 'ReservedTime{start: $start, end: $end}';
  }
}
