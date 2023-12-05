import 'package:gereaulas_mobile/controllers/teacher_controller.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:mobx/mobx.dart';

part 'reserved_time_teacher.store.g.dart';

class ReservedTimeTeacherStore = _ReservedTimeTeacherStore
    with _$ReservedTimeTeacherStore;

abstract class _ReservedTimeTeacherStore with Store {
  @observable
  DateTime start;
  @observable
  DateTime endTime;
  @observable
  String id = '';

  @observable
  TeacherStore? teacher;

  @observable
  bool isOccupied = false;

  _ReservedTimeTeacherStore({
    this.id = '',
    required this.start,
    required this.endTime,
    this.teacher = null,
    this.isOccupied = false,
  });

  @action
  void setFieldsFromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    start = DateTime.parse(json['start']);
    endTime = DateTime.parse(json['endTime']);
    isOccupied = json['occupied'] != null
        ? bool.parse(json['occupied'].toString())
        : bool.parse(json['isOccupied'].toString());
    if (json['teacher'] != null && json['teacher']['id'] != null) {
      TeacherController.findById(json['teacher']['id'].toString())
          .then((value) => teacher = value ?? TeacherStore());
    } else {
      teacher = TeacherStore();
    }
  }

  @action
  void markAsOccupied() {
    isOccupied = true;
  }

  @action
  void markAsAvailable() {
    isOccupied = false;
  }

  @override
  String toString() {
    return 'ReservedTimeTeacherStore{id: $id, start: $start, endTime: $endTime, teacher: $teacher, isOccupied: $isOccupied}';
  }

  @override
  int get hashCode => start.hashCode ^ endTime.hashCode ^ teacher.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReservedTimeTeacherStore &&
        other.start == start &&
        other.endTime == endTime &&
        other.teacher == teacher;
  }
}
