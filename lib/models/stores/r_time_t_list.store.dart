import 'package:gereaulas_mobile/controllers/reserved_controller.dart';
import 'package:gereaulas_mobile/models/stores/reserved_time_teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:mobx/mobx.dart';

part 'r_time_t_list.store.g.dart';

class TimeListStore = _TimeListStore with _$TimeListStore;

abstract class _TimeListStore with Store {
  @observable
  ObservableList<ReservedTimeTeacherStore> reservedTimeList =
      ObservableList<ReservedTimeTeacherStore>();
  _TimeListStore() {
    initTimes();
  }

  @action
  Future<void> initTimes() async {
    List<ReservedTimeTeacherStore> classList =
        await ReservedController.findAll();
    reservedTimeList.clear();
    reservedTimeList.addAll(classList);
  }

  @action
  addInitialReservedTime(Class) {}

  @action
  ObservableList<ReservedTimeTeacherStore> findByTeacher(String idTeacher) {
    List<ReservedTimeTeacherStore> filteredList = reservedTimeList
        .where((element) => element.teacher == idTeacher)
        .toList();

    return ObservableList.of(filteredList);
  }

  @action
  void addReservedTimeTeacher(
      DateTime start, DateTime endTime, TeacherStore teacher, bool isOccupied) {
    ReservedTimeTeacherStore newTime = ReservedTimeTeacherStore(
      start: start,
      endTime: endTime,
      teacher: teacher,
      isOccupied: isOccupied,
    );
    if (reservedTimeList.contains(newTime)) return;
    ReservedController.saveReservedTimeTeacher(
            reservedTimeTeacherStore: newTime)
        .then((value) => value != null ? reservedTimeList.add(value) : '');
  }

  @action
  Future<ReservedTimeTeacherStore?> addReservedTimeStoreTeacher(
      ReservedTimeTeacherStore newTime) async {
    if (reservedTimeList.contains(newTime)) {
      return null;
    }

    return ReservedController.saveReservedTimeTeacher(
            reservedTimeTeacherStore: newTime)
        .then((value) {
      print(value);
      if (value != null) {
        reservedTimeList.add(newTime);
      }
      return value;
    });
  }

  @action
  void removeReservedTimeTeacher(ReservedTimeTeacherStore reservedTimeTeacher) {
    reservedTimeList.remove(reservedTimeTeacher);
  }

  @action
  ObservableList<ReservedTimeTeacherStore> findByTeacherId(String idTeacher) {
    List<ReservedTimeTeacherStore> filteredList = reservedTimeList
        .where((element) => element.teacher?.id == idTeacher)
        .toSet()
        .toList();

    return ObservableList.of(filteredList);
  }

  @action
  ObservableList<ReservedTimeTeacherStore> findByTeacherEmail(String email) {
    List<ReservedTimeTeacherStore> filteredList = reservedTimeList
        .where((element) => element.teacher?.email == email)
        .toSet()
        .toList();

    return ObservableList.of(filteredList);
  }
}
