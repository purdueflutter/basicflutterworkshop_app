import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/bloc/class_bloc.dart';
import 'package:flutter_application_1/class/model/class.dart';
import 'package:flutter_application_1/class/new_class_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme.dart';

class NewClassButton extends StatelessWidget {
  const NewClassButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ClassBloc>(context);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      child: TextButton(
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => NewClassDialog(),
          );
          bloc.add(ClassAddEvent(Class(result['subject'], result['semester'])));
          bloc.add(ClassesGetEvent());
        },
        style: TextButton.styleFrom(
          backgroundColor: darkBlueColor,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Add a Class",
                  style: TextStyle(
                    color: lightColor,
                    fontSize: 20,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.add,
                  color: lightColor,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
