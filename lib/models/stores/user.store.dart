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
  String token = '';

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
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setToken(String value) {
    token = value;
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
  Future<bool> auth(String email, String password) async {
    try {
      await UserController.auth(email, password).then((value) {
        if (value != null) {
          this.email = value.email;
          this.password = value.password;
          id = value.id;
          token = value.token;
          isAuthenticated = true;
        } else {
          isAuthenticated = false;
        }
      });
      return isAuthenticated;
    } catch (e) {
      print('Erro de login: $e');
      isAuthenticated = false;
      token = '';
      return isAuthenticated;
    }
  }

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserStore && other.id == id && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;

  @computed
  bool get isFieldLoginFilled {
    return email != '' && password != '';
  }
}
