import 'package:shared_preferences/shared_preferences.dart';

enum PrefType {
  names1,
  names2,
  names3,
  names4,
  names5,
  names6,
  names7,
  names8,
  scores1,
  scores2,
  scores3,
  scores4,
  scores5,
  scores6,
  scores7,
  scores8,
}

class PrefHelper {
  static final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  static Future<bool> clear() async {
    return (await _pref).clear();
  }

  static Future<void> reload() async {
    return (await _pref).reload();
  }

  static Future<bool> getPrefBool(PrefType type) async {
    return (await _pref).getBool(type.name) ?? false;
  }

  static Future<bool> setPrefBool(PrefType type, bool value) async {
    return (await _pref).setBool(type.name, value);
  }

  static Future<Iterable<bool>> setPrefsBool(Iterable<PrefType> types, bool value) async {
    return await Future.wait([
      ...types.map((x) async => await setPrefBool(x, value)),
    ]);
  }

  static Future<int> getPrefInt(PrefType type) async {
    return (await _pref).getInt(type.name) ?? 0;
  }

  static Future<bool> setPrefInt(PrefType type, int value) async {
    return (await _pref).setInt(type.name, value);
  }

  static Future<Iterable<bool>> setPrefsInt(Iterable<PrefType> types, int value) async {
    return await Future.wait([
      ...types.map((x) async => await setPrefInt(x, value)),
    ]);
  }

  static Future<String> getPrefString(PrefType type) async {
    return (await _pref).getString(type.name) ?? '';
  }

  static Future<bool> setPrefString(PrefType type, dynamic value) async {
    return (await _pref).setString(type.name, value.toString());
  }

  static Future<Iterable<bool>> setPrefsString(Iterable<PrefType> types, dynamic value) async {
    return await Future.wait([
      ...types.map((x) async => await setPrefString(x, value)),
    ]);
  }

  static Future<List<String>> getPrefStringList(PrefType type) async {
    return (await _pref).getStringList(type.name) ?? const [];
  }

  static Future<bool> setPrefStringList(PrefType type, Iterable<dynamic> value) async {
    return (await _pref).setStringList(type.name, [
      ...value.map((x) => x.toString()),
    ]);
  }

  static Future<bool> removePref(PrefType type) async {
    return (await _pref).remove(type.name);
  }

  static Future<List<bool>> removePrefs(Iterable<PrefType> types) async {
    return Future.wait([
      ...types.map((x) async => await removePref(x)),
    ]);
  }
}
