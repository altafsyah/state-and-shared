import 'package:http/http.dart' as http;
import 'package:state_shared/helper/shared_preferences.dart';

class AuthService {
  Future signIn(String email, String pass) async {
    setName(email);
    return true;
  }
}
