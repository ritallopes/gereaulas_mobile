import 'dart:convert';

import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:http/http.dart' as http;

class TeacherController {
  TeacherController();
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
      if (json['email'] == null ||
          json['name'] == null ||
          json['image_profile'] == null) {
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

  static Future<TeacherStore> findById(String id) async {
    try {
      final response = await http.get(Uri.parse('$API_PATH/teachers/$id.json'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return createTeacherByJson(id, data);
        }
      } else {
        print('Falha ao buscar professor: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar por ID: $error');
    }
    return TeacherStore();
  }

  static Future<List<TeacherStore>> findAll() async {
    try {
      final response = await http.get(Uri.parse('$API_PATH/teachers.json'));
      List<TeacherStore> teachers = [];
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          data.forEach((key, value) {
            String id = key;
            teachers.add(createTeacherByJson(id, data[id]));
          });
          return teachers;
        }
      } else {
        print('Falha ao buscar professoress: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar todos: $error');
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
