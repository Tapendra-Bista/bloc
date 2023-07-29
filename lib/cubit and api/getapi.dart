import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/cubit%20and%20api/model.dart';
import 'package:test/cubit%20and%20api/url.dart';

class Fetchapi {
  List<Apimodel> fetchdata = [];

  Future<List<Apimodel>> getapi() async {
    try {
      var client = http.Client();
      var url = Uri.parse(dataurl);
      http.Response res = await client.get(
        url,
        headers: {"Content-Type ": "json/applicatioon"},
      );
      List<dynamic> data = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return fetchdata = data.map((e) => Apimodel.fromJson(e)).toList();
      }
    } catch (e) {
      //
    }
    return [];
  }
}
