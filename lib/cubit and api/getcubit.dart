import 'package:bloc/bloc.dart';
import 'package:test/cubit%20and%20api/getsatate.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/cubit%20and%20api/model.dart';
import 'package:test/cubit%20and%20api/url.dart';

class GetCubit extends Cubit<InitialSatate> {
  GetCubit() : super(LoadingSatate()) {
    getapi();
  }

  void getapi() async {
    List<Apimodel> fetchdata = [];
    try {
      var client = http.Client();
      var url = Uri.parse(dataurl);
      http.Response res = await client.get(
        url,
        headers: {"Content-Type": "json/applicatioon"},
      );
      List<dynamic> data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        fetchdata = data.map((e) => Apimodel.fromJson(e)).toList();
        emit(LoadedSatate(fetchdata));
      }
    } catch (e) {
      emit(ErrorSatate(e.toString()));
    }
  }
}
