import 'dart:convert';

import 'package:gereaulas_mobile/controllers/user_controller.dart';
import 'package:gereaulas_mobile/models/stores/responsible.store.dart';
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

  static Future<ResponsibleStore?> createResponsible(
      ResponsibleStore responsibleStore) async {
    final response = await http.post(Uri.parse('$API_LOCAL/responsible.json'),
        body: json.encode({
          'email': responsibleStore.email,
          'name': responsibleStore.name,
          'contato': responsibleStore.contact
        }));
    if (response.statusCode == 200) {
       final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return createResponsibleByMap(data);
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
    String token = UserController.tokenUser;
    if (token == '') return [];
    try {
      final response =
          await http.get(Uri.parse('$API_LOCAL/responsibles'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      List<ResponsibleStore> responsibles = [];
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.isNotEmpty) {
          for (var responsavel in data) {
            responsibles.add(createResponsibleByMap(responsavel));
          }
          return responsibles;
        }
      } else {
        print('Falha ao buscar responsaveis: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar todos os os responsáveis: $error');
    }
    return [];
  }

  static ResponsibleStore createResponsibleByMap(Map<String, dynamic> json) {
    try {
      if (json['email'] == null || json['id'] == null) {
        throw Exception("Dados de responsável inválidos no JSON");
      }
      ResponsibleStore responsibleStore = ResponsibleStore();

      responsibleStore.setId(json['id'].toString());
      responsibleStore.setEmail(json['email'].toString());
      responsibleStore.setName(json['name'].toString());
      responsibleStore.setContact(json['contato'] ?? '');
      return responsibleStore;
    } catch (e) {
      print("Erro ao criar o responsavel a partir do Map: $e");
      return ResponsibleStore();
    }
  }
}
