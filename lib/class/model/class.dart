import 'dart:convert';

import 'package:uuid/uuid.dart';

class Class {
  final String id;
  final String subject;
  final String semester;

  Class(this.subject, this.semester, {String? id}) : id = id ?? Uuid().v4();

  static Class fromJson(String data) {
    var map = json.decode(data);
    return Class(map['subject'], map['semester'], id: map['id']);
  }

  String toJson() {
    return json.encode({'id': id, 'subject': subject, 'semester': semester});
  }
}
