import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:softcity/get_storage/get_storage.dart';
import 'package:softcity/models/get_matches_res.dart';
import 'package:softcity/models/matches_get.dart';

LocalSource localSource = LocalSource.getInstance();

Future<List<GetMatchesResponce>> getMatches() async {
  debugPrint('get matches Funksiyasiga kirdi');
  String token = await GetStorage().read('token');
  Uri url = Uri.parse('https://sinov.sinovuz.uz/api/MatchesAPI');
  debugPrint('Url dan otti');
  http.Response res = await http.get(
    url,
    headers: {"Authorization": "Bearer $token"},
  );
  debugPrint('http get dan otti');
  List body = jsonDecode(res.body) as List;
  List<GetMatchesResponce> getMatchesList =
      body.map((e) => GetMatchesResponce.fromJson(e)).toList();
  debugPrint('listlardan otti');
  debugPrint("token boliwi kere wotta ${getMatchesList[0].firstTimeName}");
  return getMatchesList;
  // final res = await http.get(
  //     Uri.parse('https://sinov.sinovuz.uz/api/MatchesAPI'),
  //     headers: {"Authorization": "Bearer $token"});
  // if (res.statusCode == 200) {
  //   debugPrint('if ga kirdi ${res.body}');
  //   return GetMatchesResponce.fromJson(jsonDecode(res.body));
  // } else {
  //   debugPrint('else ga kirdi ${res.body}');

  //   throw Exception('xatto kettiku jon uke');
  // }
}
