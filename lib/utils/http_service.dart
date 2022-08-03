

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:univerties/models/universities_model.dart';

class HttpService {
  
  Future<List<Universities>> getUniversities() async{
    final res = await http.get(Uri.parse('https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Universities> universities = body.map((dynamic item) => Universities.fromJson(item)).toList();
      return universities.toList();
    }else{
      throw "Can't get Universities";
    }
  }
}