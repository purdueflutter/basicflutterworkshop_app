import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/data/localstorage_class_api.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'class/bloc/class_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            ClassBloc(classApi: LocalStorageClassApi())..add(ClassesGetEvent()),
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
