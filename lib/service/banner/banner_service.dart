import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:softcity/get_storage/get_storage.dart';
import 'package:softcity/models/banner_get.dart';

LocalSource localSource = LocalSource.getInstance();

Future<List<BannerGet>> getBanner() async {
  String token = await GetStorage().read('token');
  Uri url = Uri.parse(
    'https://sinov.sinovuz.uz/api/BannersAPI',
  );
  http.Response res = await http.get(
    url,
    headers: {"Authorization": "Bearer $token"},
  );

  List body = jsonDecode(res.body) as List;
  List<BannerGet> getBannerList =
      body.map((e) => BannerGet.fromJson(e)).toList();

  // debugPrint("token boliwi kere wotta ${getBannerList[0]}");
  return getBannerList;

  // if (res.statusCode == 200) {
  //   debugPrint('oxwadi banner keldi ${res.body}');
  //   return (res.body as List)
  //       .map((e) => BannerGet.fromJson(jsonDecode(e)))
  //       .toList();
  // } else {
  //   debugPrint("xato ketti buyogi");
  //   throw Exception('Xato chiqdi');
  // }
}
