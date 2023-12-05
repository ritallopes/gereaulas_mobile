import 'dart:convert';
import 'package:gereaulas_mobile/controllers/teacher_controller.dart';
import 'package:gereaulas_mobile/controllers/user_controller.dart';
import 'package:gereaulas_mobile/models/stores/reserved_time_teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ReservedController {
  ReservedController();

  static Future<ReservedTimeTeacherStore?> saveReservedTimeTeacher(
      {required ReservedTimeTeacherStore reservedTimeTeacherStore}) async {
    print(reservedTimeTeacherStore);
    String token = UserController.tokenUser;
    if (token == '') return null;
    try {
      DateTime start = reservedTimeTeacherStore.start;
      DateTime endTime = reservedTimeTeacherStore.endTime;
      bool isOccupied = reservedTimeTeacherStore.isOccupied;
      TeacherStore? teacherStore = reservedTimeTeacherStore.teacher;
      final response = await http.post(
        Uri.parse('$API_LOCAL/times'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'start': DateFormat('yyyy-MM-ddTHH:mm:ss').format(start),
          'endTime': DateFormat('yyyy-MM-ddTHH:mm:ss').format(endTime),
          'occupied': isOccupied.toString(),
          'teacher': {"id": teacherStore?.id.toString()},
        }),
      );
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          print(createReservedTimeTeacherByJson(data));
          return createReservedTimeTeacherByJson(data);
        }
      }
      return null;
    } catch (e) {
      print("Falha ao salvar ReservedTimeTeacher: $e");
    }
    return null;
  }

  static ReservedTimeTeacherStore createReservedTimeTeacherByJson(
      Map<String, dynamic> json) {
    try {
      if (json['id'] == null ||
          json['start'] == null ||
          json['endTime'] == null) {
        throw Exception("Dados de ReservedTimeTeacher inválidos no JSON");
      }

      ReservedTimeTeacherStore reservedTimeTeacher = ReservedTimeTeacherStore(
        id: json['id'].toString(),
        start: DateTime.parse(json['start']),
        endTime: DateTime.parse(json['endTime']),
        isOccupied: json['isOccupied'] ?? json['occupied'] ?? false,
      );

      if (json['teacher'] != null && json['teacher']['id'] != null) {
        TeacherController.findById(json['teacher']['id'].toString())
            .then((value) => reservedTimeTeacher.teacher = value);
      } else {
        reservedTimeTeacher.teacher = null;
      }

      return reservedTimeTeacher;
    } catch (e) {
      print("Erro ao criar ReservedTimeTeacher a partir do JSON: $e");
      return ReservedTimeTeacherStore(
          start: DateTime.now(), endTime: DateTime.now());
    }
  }

  static Future<ReservedTimeTeacherStore?> findById(String id) async {
    String token = UserController.tokenUser;
    if (token == '') return null;
    try {
      final response = await http.get(
        Uri.parse('$API_LOCAL/times/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return createReservedTimeTeacherByJson(data);
        }
      } else {
        print(
            'Falha ao buscar ReservedTimeTeacher por Id $id: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar ReservedTimeTeacher por ID: $error');
    }
    return null;
  }

  static Future<List<ReservedTimeTeacherStore>> findAll() async {
    String token = UserController.tokenUser;
    if (token == '') return [];
    try {
      final response = await http.get(
        Uri.parse('$API_LOCAL/times'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      List<ReservedTimeTeacherStore> reservedTimes = [];
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.isNotEmpty) {
          for (var t in data) {
            reservedTimes.add(createReservedTimeTeacherByJson(t));
          }
          return reservedTimes;
        }
      } else {
        print('Falha ao buscar ReservedTimesTeachers: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao buscar todos os ReservedTimesTeachers: $error');
    }
    return [];
  }
}
