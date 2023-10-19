import 'package:mobx/mobx.dart';
part 'user.store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void logout(){
    this.email = '';
    this.password = '';
  }
  @computed
  bool get isAuthenticated => password != '' && email != '';
}
