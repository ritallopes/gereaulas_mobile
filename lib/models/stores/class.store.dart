import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/stores/student.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:mobx/mobx.dart';
part 'class.store.g.dart';

class ClassStore = _ClassStore with _$ClassStore;

abstract class _ClassStore with Store {
  @observable
  ReservedTime _time = ReservedTime(start: DateTime.now(), end: DateTime.now());

  ReservedTime get time => _time;

  @action
  void setTime(ReservedTime value) {
    _time = value;
  }

  @observable
  String _student = '';

  String get student => _student;
  @action
  void setStudent(String value) {
    _student = value;
  }

  @observable
  String _teacher = '';

  String get teacher => _teacher;

  @action
  void setTeacher(String value) {
    _teacher = value;
  }

  @observable
  bool _residential = true;

  bool get residential => _residential;

  @action
  void setResidential(bool value) {
    _residential = value;
  }

  @observable
  double _paymentAmount = 0;

  double get paymentAmount => _paymentAmount;

  @action
  void setPaymentAmount(double value) {
    _paymentAmount = value;
  }

  @observable
  String _id = '';

  String get id => _id;

  @action
  void setId(String value) {
    _id = value;
  }

  @observable
  String _subject = '';

  String get subject => _subject;

  @action
  void setSubject(String value) {
    _subject = value;
  }

  @observable
  String _status = 'notStarted';

  String get status => _status;

  @action
  void setStatus(String value) {
    _status = value;
  }

  @computed
  ReservedTime get classTime => time;

  @computed
  String get classStudent => student;

  @computed
  String get classTeacher => teacher;

  @computed
  bool get isResidential => residential;

  @computed
  double get classPaymentAmount => paymentAmount;

  @computed
  String get classSubject => subject;

  @computed
  String get classStatus => status;

  @computed
  bool get isValid => student != '' && teacher != '';

  @action
  void changeStatus(String newStatus) {
    _status = newStatus;
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
