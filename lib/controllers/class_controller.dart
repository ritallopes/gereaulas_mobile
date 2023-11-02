import 'dart:convert';
import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:http/http.dart' as http;

class ClassController {
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
}
