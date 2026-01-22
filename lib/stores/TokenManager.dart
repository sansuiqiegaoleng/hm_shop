import 'package:shared_preferences/shared_preferences.dart';
import 'package:hm_shop/constants/index.dart';

class Tokenmanager {
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  Future<void> init() async {
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? '';
  }

  Future<void> setToken(String val) async {
    final prefs = await _getInstance();
    prefs.setString(GlobalConstants.TOKEN_KEY, val);
    _token = val;
  }

  String _token = '';

  String getToken() {
    return _token;
  }

  Future<void> removeToken() async {
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY);
    _token = '';
  }
}

final tokenManager = Tokenmanager();
