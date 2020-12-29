import 'package:shared_preferences/shared_preferences.dart';

import 'key_finder_interface.dart';

class SharedPrefKeyFinder implements KeyFinder {
  SharedPreferences _instance;

  SharedPrefKeyFinder() {
    SharedPreferences.getInstance().then((instance) {
      _instance = instance;
      // Just initializing something so that it can be fetched.
      _instance.setString('MyKey', 'I am from Shared Preference');
    });
  }

  @override
  String getKeyValue(String key) {
    return _instance?.getString(key) ??
        'shared preference is not yet initialized';
  }

  @override
  void setKeyValue(String key, String value) {
    _instance?.setString(key, value);
  }
}

KeyFinder getKeyFinder() => SharedPrefKeyFinder();
