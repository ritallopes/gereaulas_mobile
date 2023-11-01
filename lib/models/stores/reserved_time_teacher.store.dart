import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:mobx/mobx.dart';
import 'package:gereaulas_mobile/models/domain/reserved_time.dart';

part 'reserved_time_teacher.store.g.dart';

class ReservedTimeTeacherStore = _ReservedTimeTeacherStore
    with _$ReservedTimeTeacherStore;

abstract class _ReservedTimeTeacherStore with Store {
  @observable
  ReservedTime reservedTime;

  @observable
  TeacherStore teacher = TeacherStore();

  @observable
  bool isOccupied = false;

  _ReservedTimeTeacherStore({
    required this.reservedTime,
    required this.teacher,
    this.isOccupied = false,
  });

  @action
  void markAsOccupied() {
    isOccupied = true;
  }

  @action
  void markAsAvailable() {
    isOccupied = false;
  }
}
