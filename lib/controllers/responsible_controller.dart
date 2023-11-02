import 'dart:convert';

import 'package:gereaulas_mobile/models/stores/responsible.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:http/http.dart' as http;

class ResponsibleController {
  ResponsibleController();
  static Future<ResponsibleStore?> createUser(
    String email,
    String password,
    String type,
  ) async {
    final response = await http.post(Uri.parse('$API_PATH/responsible.json'),
        body: json
            .encode({'email': email, 'password': password, 'contact': type}));
    if (response.statusCode == 200) {
      String idResp = json.decode(response.body)['name'];
      if (idResp != '') {
        return findById(idResp);
      }
    }
    return null;
  }

  static ResponsibleStore _createUserByJson(
      String id, Map<String, dynamic> json) {
    try {
      if (json['email'] == null || json['name'] == null) {
        throw Exception("Dados de usuário inválidos no JSON");
      }

      ResponsibleStore responsibleStore = ResponsibleStore();
      responsibleStore.setId(id);
      responsibleStore.setName(json['name'] ?? '');
      responsibleStore.setEmail(json['email'] ?? '');
      responsibleStore.setContact(json['contact'] ?? '');

      return responsibleStore;
    } catch (e) {
      print("Erro ao criar o Responsible a partir do JSON: $e");
      return ResponsibleStore();
    }
  }

  static Future<ResponsibleStore?> findById(String id) async {
    try {
      final response =
          await http.get(Uri.parse('$API_PATH/responsible/$id.json'));

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

  static Future<List<ResponsibleStore>> findAll() async {
    try {
      final response = await http.get(Uri.parse('$API_PATH/responsible.json'));
      List<ResponsibleStore> responsibles = [];
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          data.forEach((key, value) {
            String id = key;
            ResponsibleStore responsibleStore = _createUserByJson(id, data[id]);
            if (responsibleStore.id != '') {
              responsibles.add(responsibleStore);
            }
          });
          return responsibles;
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
