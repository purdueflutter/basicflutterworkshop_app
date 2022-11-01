import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/class/model/class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/class_api.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final ClassApi classApi;

  ClassBloc({required this.classApi}) : super(ClassState(const [])) {
    on<ClassAddEvent>((event, emit) async {
      await classApi.createClass(event.$class);
    });
    on<ClassesGetEvent>((event, emit) async {
      final classes = await classApi.readClasses();
      emit(state.copyWith(classes: classes));
    });
  }
}
