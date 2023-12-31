import 'package:flutter/material.dart';
import 'package:flutter_application_0612/cubit/app_cubit_logics.dart';
import 'package:flutter_application_0612/cubit/app_cubits.dart';
import 'package:flutter_application_0612/services/data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.blue),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(data: DataServices()),
          child: const AppCubitLogics(),
        ));
  }
}
