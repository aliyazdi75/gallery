import 'key_finder_stub.dart'
    if (dart.library.io) 'shared_pref_key_finder.dart'
    if (dart.library.html) 'web_key_finder.dart';

abstract class KeyFinder {
  // some generic methods to be exposed.

  /// returns a value based on the key
  String getKeyValue(String key) {
    return 'I am from the interface';
  }

  /// stores a key value pair in the respective storage.
  void setKeyValue(String key, String value) {}

  /// factory constructor to return the correct implementation.
  factory KeyFinder() => getKeyFinder();
}
