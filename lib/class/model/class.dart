import 'package:equatable/equatable.dart';

class Class extends Equatable {
  final String subject;
  final String date;

  const Class(this.subject, this.date);

  @override
  List<Object?> get props => [subject, date];
}
