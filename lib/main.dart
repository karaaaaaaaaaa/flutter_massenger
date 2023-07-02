// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/constants.dart';
import 'package:messanger/messanger/home.dart';

import 'package:messanger/messanger/login.dart';
import 'package:messanger/messanger/register.dart';
import 'package:messanger/todo_cubit%20copy/cubit.dart';


import 'CounterApp/counter/Counter_Screen.dart';
import 'CounterApp/counter/cubit/cubit.dart';
import 'ToDoApp copy/tasks/tasks_screen.dart';
import 'ToDoApp copy/todo_layout/todo_layout.dart';


import 'bmi/bmi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (BuildContext context) => TodoCubit(TodoInitialState())
          //     ..changeDarkMode(fromShared: false
          //         //!isDark!
          //         ),
          // ),
          BlocProvider(create: (BuildContext context) => todocubit()),
        ],
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: Todolayout()));
  }
}
