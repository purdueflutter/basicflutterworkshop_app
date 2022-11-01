part of 'class_bloc.dart';

abstract class ClassEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ClassAddEvent extends ClassEvent {
  final Class $class;

  ClassAddEvent(this.$class);

  @override
  List<Object?> get props => [$class];
}

class ClassesGetEvent extends ClassEvent {
  ClassesGetEvent();
}
