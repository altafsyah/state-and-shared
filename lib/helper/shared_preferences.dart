import 'package:shared_preferences/shared_preferences.dart';

Future setToken(int token) async {
  final SharedPreferences _pref = await SharedPreferences.getInstance();
  _pref.setInt('token', token);
}

Future? getToken() async {
  final SharedPreferences _pref = await SharedPreferences.getInstance();
  return _pref.getInt('token');
}

Future setName(String name) async {
  final SharedPreferences _pref = await SharedPreferences.getInstance();
  _pref.setString('name', name);
}

Future? getName() async {
  final SharedPreferences _pref = await SharedPreferences.getInstance();
  return _pref.getString('name');
}

Future setOnboardingSeen(bool isSeen) async {
  final SharedPreferences _pref = await SharedPreferences.getInstance();
  _pref.setBool('is_seen', isSeen);
}

Future? getOnboardingSeen() async {
  final SharedPreferences _pref = await SharedPreferences.getInstance();
  return _pref.getBool('is_seen');
}
