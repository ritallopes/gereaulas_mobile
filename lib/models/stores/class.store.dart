import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/domain/student.dart';
import 'package:gereaulas_mobile/models/domain/teacher.dart';
import 'package:mobx/mobx.dart';
part 'class.store.g.dart';

class ClassStore = _ClassStore with _$ClassStore;

abstract class _ClassStore with Store {
  @observable
  ReservedTime time =
      new ReservedTime(start: DateTime.now(), end: DateTime.now());
  @observable
  Student student = new Student();
  @observable
  Teacher teacher = new Teacher();
  @observable
  bool residential = true;
  @observable
  double paymentAmount = 0;
  @observable
  String subject = '';
  @observable
  String status = 'notStarted';

  @computed
  ReservedTime get classTime => time;

  @computed
  Student get classStudent => student;

  @computed
  Teacher get classTeacher => teacher;

  @computed
  bool get isResidential => residential;

  @computed
  double get classPaymentAmount => paymentAmount;

  @computed
  String get classSubject => subject;

  @computed
  String get classStatus => status;

  @computed
  bool get isValid => student.email != '' && teacher.email != '';
  @action
  _ClassStore(
      {required this.time,
      required this.student,
      required this.teacher,
      this.residential = true,
      this.paymentAmount = 0,
      this.subject = '',
      this.status = ''});

  @action
  void changeStatus(String newStatus) {
    status = newStatus;
  }

  @override
  String toString() {
    return 'ClassStore{'
        'time: $time, '
        'student: $student, '
        'teacher: $teacher, '
        'residential: $residential, '
        'paymentAmount: $paymentAmount, '
        'subject: $subject, '
        'status: $status}';
  }
}
