import 'dart:convert';
import 'package:gereaulas_mobile/controllers/user_controller.dart';
import 'package:gereaulas_mobile/models/stores/student.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:http/http.dart' as http;

class StudentController {
  static Future<StudentStore?> createStudent(
      String name,
      String email,
      String contact,
      String idResponsible,
      String address,
      DateTime dateBirth) async {
    try {
      final response = await http.post(Uri.parse('$API_PATH/students.json'),
          body: json.encode({
            'name': name,
            'email': email,
            'contact': contact,
            'dateBirth': dateBirth,
            'address': address,
            'idResponsible': idResponsible,
          }));

      if (response.statusCode == 200) {
        String idStudent = json.decode(response.body)['name'];
        if (idStudent != '') {
          return findById(idStudent);
        }
      }
    } catch (error) {
      print('Erro ao criar estudante: $error');
    }
    return null;
  }

  static StudentStore _createUserByMap(Map<String, dynamic> json) {
    try {
      if (json['email'] == null || json['id'] == null) {
        throw Exception("Dados de aluno inválidos no JSON");
      }
      StudentStore studentStore = StudentStore();

      studentStore.setId(json['id'].toString());
      studentStore.setEmail(json['email'].toString());
      studentStore.setContact(json['contato'].toString());
      studentStore.setName(json['name'].toString());
      studentStore.setAddress(json['address']..toString());
      studentStore.setDateBirth(json['dateBirth'].toString());
      studentStore.setIdResponsible(json['idResponsible'].toString());
      return studentStore;
    } catch (e) {
      print("Erro ao criar o aluno a partir do Map: $e");
      return StudentStore();
    }
  }

  static Future<List<StudentStore>> findAllLocal() async {
    print("FINDALL Aluno\n");
    String token = UserController.tokenUser;
    if (token == '') return [];
    try {
      final response =
          await http.get(Uri.parse('$API_LOCAL/students'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      List<StudentStore> students = [];
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.isNotEmpty) {
          for (var s in data) {
            students.add(_createUserByMap(s));
          }
          return students;
        }
      } else {
        print('Falha ao buscar alunos local: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar todos os alunos local: $error');
    }
    return [];
  }

  static StudentStore createStudentByJson(
      String id, Map<String, dynamic> json) {
    print(json);
    print(id);
    try {
      if (json['email'] == null ||
          json['name'] == null ||
          json['address'] == null) {
        throw Exception("Dados de estudantes inválidos no JSON");
      }

      StudentStore studentStore = StudentStore();
      studentStore.setId(id);
      studentStore.setEmail(json['email'] ?? '');
      studentStore.setContact(json['contact'] ?? '');
      studentStore.setName(json['name'] ?? '');
      studentStore.setAddress(json['address'] ?? '');
      studentStore.setDateBirth(json['dateBirth'] ?? '');
      studentStore.setIdResponsible(json['idResponsible'] ?? '');

      return studentStore;
    } catch (e) {
      print("Erro ao criar o estudante a partir do JSON: $e");
      return StudentStore();
    }
  }

  static Future<StudentStore?> findById(String id) async {
    try {
      final response = await http.get(Uri.parse('$API_PATH/students/$id.json'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return createStudentByJson(id, data);
        }
      } else {
        print('Falha ao buscar estudante: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar estudante por ID: $error');
    }
    return null;
  }

  static Future<List<StudentStore>> findAll() async {
    String token = UserController.tokenUser;
    if (token == '') return [];
    try {
      final response = await http.get(Uri.parse('$API_PATH/students.json'));
      List<StudentStore> students = [];
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body) ?? {};
        if (data.isNotEmpty) {
          data.forEach((key, value) {
            String id = key;
            students.add(createStudentByJson(id, value));
          });
          return students;
        }
      } else {
        print('Falha ao buscar estudantes: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar todos os estudantes: $error');
    }
    return [];
  }

  static Future<void> deleteStudent(String id) async {
    try {
      final response =
          await http.delete(Uri.parse('$API_PATH/students/$id.json'));

      if (response.statusCode == 200) {
        print('Estudante deletado com sucesso');
      } else {
        print('Falha ao deletar estudante: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao deletar estudante: $error');
    }
  }

  static Future<StudentStore?> updateStudent(StudentStore student) async {
    try {
      final response = await http.patch(
        Uri.parse('$API_PATH/students/${student.id}.json'),
        body: json.encode({
          'name': student.name,
          'email': student.email,
          'contact': student.contact,
          'dateBirth': student.dateBirth,
          'address': student.address,
          'idResponsible': student.idResponsible,
        }),
      );

      if (response.statusCode == 200) {
        String id = json.decode(response.body)['name'];

        if (id != '') {
          return findById(id);
        }
      } else {
        print('Falha ao atualizar estudante: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao atualizar estudante: $error');
    }
    return null;
  }
}
