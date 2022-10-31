import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/bloc/class_bloc.dart';
import 'package:flutter_application_1/class/class_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme.dart';
import 'new_class_button.dart';

class ManageView extends StatelessWidget {
  const ManageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassBloc, ClassState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Manage Classes",
                style: TextStyle(
                  fontSize: 28,
                  color: darkBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NewClassButton(),
            Flexible(
              child: ListView.builder(
                itemCount: state.classes.length,
                itemBuilder: (context, index) {
                  return ClassContainer($class: state.classes[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
