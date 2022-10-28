part of 'class_bloc.dart';

abstract class ClassEvent extends Equatable {
  const ClassEvent();

  @override
  List<Object> get props => [];
}

class ClassAddEvent extends ClassEvent {
  final Class $class;

  const ClassAddEvent(this.$class);

  @override
  List<Object> get props => [$class];
}
