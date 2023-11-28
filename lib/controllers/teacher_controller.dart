import 'dart:convert';

import 'package:gereaulas_mobile/controllers/user_controller.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:http/http.dart' as http;

class TeacherController {
  TeacherController();

  static Future<TeacherStore?> saveTeacher(
    String name,
    String email,
    String image_profile,
  ) async {
    try {
      final response = await http.post(Uri.parse('$API_LOCAL/teachers'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(
              {'name': name, 'email': email, 'image_profile': image_profile}));
      print({'name': name, 'email': email, 'image_profile': image_profile});

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return createTeacherByMap(data);
        }
      }
      return null;
    } catch (e) {
      print("Falha ao salvar professor: " + e.toString());
    }
  }

  static TeacherStore createTeacherByMap(Map<String, dynamic> json) {
    try {
      if (json['email'] == null || json['id'] == null) {
        throw Exception("Dados de professor inválidos no JSON");
      }
      TeacherStore teacherStore = TeacherStore();

      teacherStore.setId(json['id'].toString());
      teacherStore.setEmail(json['email'].toString());
      teacherStore.setName(json['name'].toString());
      teacherStore.setImageProfile(json['image_profile'].toString());
      return teacherStore;
    } catch (e) {
      print("Erro ao criar o professor a partir do Map: $e");
      return TeacherStore();
    }
  }

  static Future<TeacherStore?> findByEmail(String email) async {
    String token = UserController.tokenUser;
    if (token == '') return null;
    final response =
        await http.get(Uri.parse('$API_LOCAL/teachers/email/$email'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        return createTeacherByMap(data);
      }
    } else {
      print("Professor com o email $email não foi encontrado!");
      return null;
    }
  }

  static Future<TeacherStore?> createTeacher(
    String name,
    String email,
    String image_profile,
  ) async {
    final response = await http.post(Uri.parse('${API_PATH}/teachers.json'),
        body: json.encode(
            {'name': name, 'email': email, 'image_profile': image_profile}));
    if (response.statusCode == 200) {
      String idTeacher = json.decode(response.body)['name'];
      if (idTeacher != '') {
        return findById(idTeacher);
      }
    }
    return null;
  }

  static TeacherStore createTeacherByJson(
      String id, Map<String, dynamic> json) {
    try {
      if (json['email'] == null || json['name'] == null) {
        throw Exception("Dados de professores inválidos no JSON");
      }

      TeacherStore teacherStore = TeacherStore();
      teacherStore.setId(id);
      teacherStore.setEmail(json['email'] ?? '');
      teacherStore.setName(json['name'] ?? '');
      teacherStore.setImageProfile(json['image_profile'] ?? '');

      return teacherStore;
    } catch (e) {
      print("Erro ao criar o professor a partir do JSON: $e");
      return TeacherStore();
    }
  }

  static Future<TeacherStore?> findById(String id) async {
    String token = UserController.tokenUser;
    if (token == '') return null;
    try {
      final response =
          await http.get(Uri.parse('$API_LOCAL/teachers/$id'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return createTeacherByMap(data);
        }
      } else {
        print('Falha ao buscar professor por Id $id: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar professor por ID: $error');
    }
    return null;
  }

  static Future<List<TeacherStore>> findAll() async {
    String token = UserController.tokenUser;
    if (token == '') return [];
    try {
      final response =
          await http.get(Uri.parse('$API_LOCAL/teachers'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      List<TeacherStore> teachers = [];
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.isNotEmpty) {
          for (var t in data) {
            teachers.add(createTeacherByMap(t));
          }
          return teachers;
        }
      } else {
        print('Falha ao buscar professores: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar toErrodos os professores: $error');
    }
    return [];
  }

  static Future<void> deleteTeacher(String id) async {
    try {
      final response =
          await http.delete(Uri.parse('$API_PATH/teachers/$id.json'));

      if (response.statusCode == 200) {
        print('Professor deletado com sucesso');
      } else {
        print('Falha ao deletar professor: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao deletar: $error');
    }
  }

  static Future<TeacherStore?> updateTeacher(TeacherStore teacher) async {
    try {
      final response = await http.patch(
        Uri.parse('$API_PATH/teachers/${teacher.id}.json'),
        body: json.encode({
          'name': teacher.name,
          'email': teacher.email,
          'image_profile': teacher.image_profile,
        }),
      );

      if (response.statusCode == 200) {
        String id = json.decode(response.body)['name'];

        if (id != '' && id.isNotEmpty) {
          return findById(id);
        }
      } else {
        print('Falha ao atualizar professor: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao atualizar: $error');
    }
    return null;
  }
}
