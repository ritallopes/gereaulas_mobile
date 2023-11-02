import 'package:gereaulas_mobile/models/stores/reserved_time_teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:mobx/mobx.dart';
import 'package:gereaulas_mobile/models/domain/reserved_time.dart';

part 'r_time_t_list.store.g.dart';

class RTimeRListStore = _RTimeRListStore with _$RTimeRListStore;

abstract class _RTimeRListStore with Store {
  @observable
  ObservableList<ReservedTimeTeacherStore> reservedTimeList =
      ObservableList.of([]);

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
      ReservedTime reservedTime, TeacherStore teacher, bool isOccupied) {
    reservedTimeList.add(ReservedTimeTeacherStore(
      reservedTime:
          ReservedTime(start: reservedTime.start, end: reservedTime.end),
      teacher: teacher,
      isOccupied: isOccupied,
    ));
  }

  @action
  void removeReservedTimeTeacher(ReservedTimeTeacherStore reservedTimeTeacher) {
    reservedTimeList.remove(reservedTimeTeacher);
  }
}
