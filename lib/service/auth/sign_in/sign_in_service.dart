import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:softcity/models/login.dart';

Future<LogInModel> login(String login, String password) async {
  final res = await http.post(Uri.parse(
      'http://147.182.136.35:7070/api/LoginAPI?Email=$login&Password=$password'));
  if (res.statusCode == 200) {
    
    return LogInModel.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("api dan ma'lumot xato keldi");
  }
}
