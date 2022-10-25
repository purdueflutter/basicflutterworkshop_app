part of 'class_bloc.dart';

class ClassState extends Equatable {
  final List<Class> classes;

  ClassState(this.classes);

  @override
  List<Object?> get props => [classes];
}
