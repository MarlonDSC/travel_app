import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  static const String baseUrl = "http://127.0.0.1:8000";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/api/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <DataModel>[];
    }
  }
}
