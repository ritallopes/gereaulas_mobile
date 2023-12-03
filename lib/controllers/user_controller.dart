import 'dart:convert';

import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:http/http.dart' as http;

class UserController {
  UserController();

  static String tokenUser = '';
  static Future<UserStore?> auth(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$API_LOCAL/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email, 'password': password}),
      );

      print("\n RESPONSE: " + response.body + " - " + email + " " + password);
      if (response.statusCode == 200) {
        String token = response.body;
        tokenUser = token;
        return findByEmail(email, token);
      } else {
        print("Falha na autenticação: Response status " +
            response.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("Falha ao autenticar : " + e.toString());
      return null;
    }
  }

  static UserStore _createUserByMapToken(
      Map<String, dynamic> json, String? token) {
    try {
      if (json['email'] == null ||
          json['password'] == null ||
          json['id'] == null) {
        throw Exception("Dados de usuário inválidos no JSON");
      }
      UserStore userStore = UserStore();

      userStore.setId(json['id'].toString());
      userStore.setToken(token.toString() ?? '');
      userStore.setEmail(json['email'].toString());
      userStore.setPassword(json['password'].toString());
      userStore.setType(json['type'].toString());
      return userStore;
    } catch (e) {
      print("Erro ao criar o usuário a partir do Map: $e");
      return UserStore();
    }
  }

  static UserStore _createUserByMap(Map<String, dynamic> json) {
    try {
      if (json['email'] == null ||
          json['password'] == null ||
          json['id'] == null) {
        throw Exception("Dados de usuário inválidos no JSON");
      }
      UserStore userStore = UserStore();

      userStore.setId(json['id'].toString());
      userStore.setEmail(json['email'].toString());
      userStore.setPassword(json['password'].toString());
      userStore.setType(json['type'].toString());
      return userStore;
    } catch (e) {
      print("Erro ao criar o usuário a partir do Map: $e");
      return UserStore();
    }
  }

  static Future<UserStore?> findByEmail(String email, String token) async {
    final response =
        await http.get(Uri.parse('$API_LOCAL/users/email/$email'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        return _createUserByMapToken(data, token);
      }
    } else {
      print("Falha ao buscar por email");
    }
    return null;
  }

  static Future<UserStore?> saveUser(
    String email,
    String password,
    String type,
  ) async {
    try {
      final response = await http.post(Uri.parse('$API_LOCAL/users'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json
              .encode({'email': email, 'password': password, 'type': type}));
      print(json.decode(response.body));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return _createUserByMap(data);
        }
      }
      return null;
    } catch (e) {
      print("Falha ao salvar usuário: " + e.toString());
    }
    return null;
  }

//
  ///
////
/////
  static Future<UserStore?> createUser(
    String email,
    String password,
    String type,
  ) async {
    final response = await http.post(Uri.parse('$API_PATH/users.json'),
        body:
            json.encode({'email': email, 'password': password, 'type': type}));
    if (response.statusCode == 200) {
      String idUser = json.decode(response.body)['name'];
      if (idUser != '') {
        return findById(idUser);
      }
    }
    return null;
  }

  static UserStore _createUserByJson(String id, Map<String, dynamic> json) {
    try {
      if (json['email'] == null ||
          json['password'] == null ||
          json['type'] == null) {
        throw Exception("Dados de usuário inválidos no JSON");
      }

      UserStore userStore = UserStore();
      userStore.setId(id);
      userStore.setEmail(json['email'] ?? '');
      userStore.setPassword(json['password'] ?? '');
      userStore.setType(json['type'] ?? '');

      return userStore;
    } catch (e) {
      print("Erro ao criar o usuário a partir do JSON: $e");
      return UserStore();
    }
  }

  static Future<UserStore?> findById(String id) async {
    try {
      final response = await http.get(Uri.parse('$API_PATH/users/$id.json'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return _createUserByJson(id, data);
        }
      } else {
        print('Falha ao buscar usuário: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao procurar user por id: $error');
    }
    return null;
  }

  static Future<List<UserStore>> findAll() async {
    try {
      final response = await http.get(Uri.parse('$API_PATH/users.json'));
      List<UserStore> users = [];
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          data.forEach((key, value) {
            String id = key;
            UserStore user = _createUserByJson(id, data[id]);
            if (user.id != '') {
              users.add(user);
            }
          });
          return users;
        }
      } else {
        print('Falha ao buscar usuários: ${response.statusCode}');
      }
    } catch (error) {
      print('no findAll');
      print('Erro ao buscar todos os usuários: $error');
    }
    return [];
  }
}
