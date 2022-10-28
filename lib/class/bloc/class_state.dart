part of 'class_bloc.dart';

class ClassState extends Equatable {
  final List<Class> classes;

  const ClassState(this.classes);

  @override
  List<Object> get props => [classes];

  ClassState copyWith({List<Class>? classes}) {
    return ClassState(classes ?? this.classes);
  }
}
