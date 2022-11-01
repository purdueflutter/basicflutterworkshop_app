import 'dart:convert';

import 'package:uuid/uuid.dart';

class Class {
  final String id;
  final String subject;

  Class(this.subject, {String? id}) : id = id ?? Uuid().v4();

  static Class fromJson(String data) {
    var map = json.decode(data);
    return Class(map['subject'], id: map['id']);
  }

  String toJson() {
    return json.encode({'id': id, 'subject': subject});
  }
}
