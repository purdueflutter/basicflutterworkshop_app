import 'package:flutter_application_1/class/model/class.dart';

abstract class ClassApi {
  Future<void> createClass(Class $class);
  Future<Class> readClass(String id);
  Future<void> deleteClass(Class $class);
}
