import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/class/class.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  ClassBloc() : super(ClassState(const [])) {
    on<ClassAddEvent>((event, emit) {
      emit(state.copyWith(classes: [...state.classes, event.$class]));
    });
  }
}
