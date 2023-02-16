import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:state_shared/helper/shared_preferences.dart';
import 'package:state_shared/base_service.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future signIn(String email, String pass) async {
    Uri url = Uri.parse('${baseUrl}/login');
    var request =
        await http.post(url, body: {'email': email, 'password': pass});

    if (request.statusCode == 200) {
      setToken(jsonDecode(request.body)['data']['id']);
      setName(jsonDecode(request.body)['data']['nama']);
      print("SUkses");
      return true;
    } else {
      return false;
    }
  }

  Future register(String nama, String email, String password) async {
    Uri url = Uri.parse('${baseUrl}/register');
    var request = await http
        .post(url, body: {'nama': nama, 'email': email, 'password': password});
    if (request.statusCode == 200) {
      print(jsonDecode(request.body)['data']['id']);
      setToken(jsonDecode(request.body)['data']['id']);
    }
  }
}
