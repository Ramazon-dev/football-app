import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:softcity/get_storage/get_storage.dart';
import 'package:softcity/models/news_get.dart';

LocalSource localSource = LocalSource.getInstance();

Future<List<GetNews>> getNews() async {
  debugPrint("funksiya");
  String token = await GetStorage().read('token');
  Uri url = Uri.parse(
    'https://sinov.sinovuz.uz/api/NewsAPI',
  );
  http.Response res = await http.get(
    url,
    headers: {"Authorization": "Bearer $token"},
  );
  debugPrint("http get dan otti");

  List body = jsonDecode(res.body) as List;
  List<GetNews> getNewsList = body.map((e) => GetNews.fromJson(e)).toList();
  debugPrint("listlardan otti ${getNewsList[1].photo}");
  return getNewsList;
}
