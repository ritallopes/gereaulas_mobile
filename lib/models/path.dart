import 'package:gereaulas_mobile/models/reserved_time.dart';

class Path{
  String source;
  String target;
  ReservedTime time;

  Path({required this.source, required this.target, required this.time});
}