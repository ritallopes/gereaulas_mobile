import 'dart:convert';
import 'package:gereaulas_mobile/controllers/user_controller.dart';
import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:gereaulas_mobile/models/stores/reserved_time_teacher.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ClassController {
  static Future<ClassStore?> createClass(ClassStore classData) async {
    String token = UserController.tokenUser;
    if (token == '') return null;
    try {
      var bodyObj = {
        "time": {
          "start": DateFormat('yyyy-MM-ddTHH:mm:ss')
              .format(classData.classTime.start),
          "endTime": DateFormat('yyyy-MM-ddTHH:mm:ss')
              .format(classData.classTime.start),
          "id": classData.classTime.id,
          "occupied": classData.classTime.isOccupied,
          "teacher": {"id": classData.classTime.teacher?.id}
        },
        "student": {
          "id": classData.classStudent.toString(),
        },
        "teacher": {
          "id": classData.classStudent.toString(),
        },
        "residential": classData.residential.toString(),
        "paymentAmount": classData.paymentAmount.toString(),
        "subject": classData.subject.toString(),
        "status": classData.status.toString(),
        "address": classData.address.toString(),
      };
      final response = await http.post(Uri.parse('$API_LOCAL/classes'),
          body: json.encode(bodyObj),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return createClassByMap(data);
        }
        print('Classe cadastrada com sucesso!');
      } else {
        print('Falha ao cadastrar aula: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao cadastrar aula: $error');
    }
  }

  static ClassStore _createByJson(String id, Map<String, dynamic> json) {
    try {
      if (id == '' || json['teacher'] == null || json['student'] == null) {
        throw Exception("Dados de professores inválidos no JSON");
      }

      ClassStore classStore = ClassStore();
      classStore.setId(id);
      classStore.setPaymentAmount(double.parse(json['paymentAmount']));
      classStore.setStudent(json['student']);
      classStore.setTeacher(json['teacher']);
      classStore.setResidential(bool.parse(json['residential']));
      classStore.setSubject(json['subject']);
      classStore.setStatus(json['status'] ?? 'notStarted');
      classStore.setTime(json['time'] ??
          ReservedTime(start: DateTime.now(), end: DateTime.now()));

      return classStore;
    } catch (e) {
      print("Erro ao criar o aulas a partir do JSON: $e");
      return ClassStore();
    }
  }

  static Future<List<ClassStore>> findAll() async {
    List<ClassStore> classes = [];

    try {
      final response = await http.get(Uri.parse('$API_PATH/classes.json'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.isNotEmpty) {
          data.forEach((key, value) {
            String id = key;
            classes.add(_createByJson(id, data[id]));
          });
          return classes;
        }
      } else {
        print('Falha ao buscar aulas: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar todas as aulas: $error');
    }
    return classes;
  }

  static ClassStore createClassByMap(Map<String, dynamic> json) {
    try {
      if (json['id'] == null) {
        throw Exception("Dados de professores inválidos no JSON");
      }
      ClassStore classStore = ClassStore();
      classStore.setId(json['id'].toString());
      classStore
          .setPaymentAmount(double.parse(json['paymentAmount'].toString()));
      classStore.setStudent(json['student']['id'].toString());
      classStore.setTeacher(json['teacher']['id'].toString());
      classStore.setResidential(bool.parse(json['residential'].toString()));
      classStore.setSubject(json['subject'].toString());
      classStore.setStatus(json['status'] ?? 'notStarted');
      ReservedTimeTeacherStore time = ReservedTimeTeacherStore(
          start: DateTime.now(), endTime: DateTime.now());
      time.setFieldsFromJson(json['time']);
      classStore.setTime(time);
      return classStore;
    } catch (e) {
      print("Erro ao criar o aulas a partir do Map: $e");
      return ClassStore();
    }
  }

  static Future<List<ClassStore>> findAllLocal() async {
    List<ClassStore> classes = [];
    String token = UserController.tokenUser;
    if (token == '') return classes;
    try {
      final response =
          await http.get(Uri.parse('$API_LOCAL/classes'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.isNotEmpty) {
          for (var classe in data) {
            classes.add(createClassByMap(classe));
          }

          return classes;
        }
      } else {
        print('Falha ao buscar aulas: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar todas as aulas: $error');
    }
    return classes;
  }
}
