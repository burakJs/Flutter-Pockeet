import 'package:shared_preferences/shared_preferences.dart';

import '../../enum/locale_enum.dart';

class LocaleManager {
  static LocaleManager? _instance;
  static LocaleManager get instance => _instance ??= LocaleManager._init();
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  SharedPreferences? _preferences;

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  Future<bool> setFirstLogin(bool firstLogin) async {
    final bool? result = await _preferences?.setBool(LocaleEnum.firstLogin.name, firstLogin);
    return result ?? false;
  }

  bool isFirstLogin() {
    final bool? result = _preferences?.getBool(LocaleEnum.firstLogin.name);
    return result ?? true;
  }
}
