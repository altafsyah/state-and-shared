import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:state_shared/model/resep_model.dart';
import 'package:state_shared/base_service.dart';

class ResepService {
  Future<Resep?> getAllResep() async {
    Uri url = Uri.parse('${baseUrl}/home');
    var request = await http.get(url);
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      Resep resep = Resep.fromJson(response);
      return resep;
    } else {
      return null;
    }
  }
}
