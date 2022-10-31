import 'package:flutter_application_1/class/data/class_api.dart';
import 'package:flutter_application_1/class/model/class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageClassApi extends ClassApi {
  @override
  Future<void> createClass(Class $class) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString($class.id, $class.toJson());
  }

  @override
  Future<void> deleteClass(Class $class) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove($class.id);
  }

  @override
  Future<Class> readClass(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return Class.fromJson(prefs.getString(id)!);
  }
}
