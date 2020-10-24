import 'package:CatchTheGoal/core/constants/enums/locale_keys_enum.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static LocaleManager _instance = LocaleManager._init();

  SharedPreferences _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static preferencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }

    //instance._preferences.setString(key, value)
    return;
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences.setString(key.toString(), value);
  }

  /* Future<String> getStringValue(PreferencesKeys key) async {
    await _preferences.getString(key.toString());
  }*/
  String getStringValue(PreferencesKeys key) =>
      _preferences.getString(key.toString()) ?? "";
}
