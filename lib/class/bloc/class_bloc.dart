import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/class/model/class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  ClassBloc() : super(ClassState(const [])) {
    on<ClassAddEvent>((event, emit) {
      state.classes.add(event.$class);
      emit(ClassState(state.classes));
    });
  }
}
