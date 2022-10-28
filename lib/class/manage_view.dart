import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme.dart';
import 'bloc/class_bloc.dart';
import 'class_container.dart';

class ManageView extends StatelessWidget {
  const ManageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "My Classes",
            style: TextStyle(
              fontSize: 28,
              color: darkBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Flexible(
          child: BlocBuilder<ClassBloc, ClassState>(
            builder: (context, state) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.classes.length,
                itemBuilder: (context, index) => ClassContainer(
                  subject: state.classes[index].subject,
                  date: state.classes[index].date,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
