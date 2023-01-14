import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _name = '', _password = '';
  static bool _recordar = false;

  //Recupera valor al iniciar aplicacion
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name => _prefs.getString('nom') ?? _name;

  static set name(String value) {
    _name = value;
    _prefs.setString('nom', value);
  }

  static String get password => _prefs.getString('password') ?? _password;

  static set password(String value) {
    _password = value;
    _prefs.setString('password', value);
  }

  static bool get recordar => _prefs.getBool('recordar') ?? _recordar;

  static set recordar(bool value) {
    _recordar = value;
    _prefs.setBool('recordar', value);
  }
}
