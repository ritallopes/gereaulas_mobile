import 'package:gereaulas_mobile/controllers/user_controller.dart';
import 'package:mobx/mobx.dart';
part 'user.store.g.dart';

enum UserType { TEACHER, STUDENT, RESPONSIBLE, NOTYPE }

UserType getUserTypeFromString(String userTypeString) {
  try {
    return UserType.values.firstWhere((type) =>
        type.toString().split('.').last == userTypeString.toUpperCase());
  } catch (e) {
    throw Exception('Tipo de usuário inválido: $userTypeString');
  }
}

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  String id = '';
  @action
  void setId(String value) => id = value;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setEmail(String value) {
    print(email);
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  UserType type = UserType.NOTYPE;
  @action
  void setType(String value) {
    switch (value) {
      case 'TEACHER':
        type = UserType.TEACHER;
        break;
      case 'STUDENT':
        type = UserType.STUDENT;
        break;
      case 'RESPONSIBLE':
        type = UserType.RESPONSIBLE;
        break;
      default:
        type = UserType.STUDENT;
    }
  }

  @observable
  bool isAuthenticated = false;

  @action
  Future<bool> login(String email, String password) async {
    try {
      List<UserStore> users = await UserController.findAll();
      if (users.isNotEmpty) {
        UserStore authenticatedUser = users.firstWhere(
          (user) => user.email == email && user.password == password,
          orElse: () => UserStore(),
        );

        if (authenticatedUser.id != '') {
          type = authenticatedUser.type;
          id = authenticatedUser.id;
          isAuthenticated = true;
          return isAuthenticated;
        }
      }
      isAuthenticated = false;
      return isAuthenticated;
    } catch (error) {
      print('Erro de login: $error');
      isAuthenticated = false;
      return isAuthenticated;
    } finally {
      return isAuthenticated;
    }
  }

  @action
  void logout() {
    id = '';
    email = '';
    password = '';
    type = UserType.NOTYPE;
    isAuthenticated = false;
  }

  @computed
  bool get isFieldLoginFilled {
    print(email + " - " + password);
    return email != '' && password != '';
  }
}
