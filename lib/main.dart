// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/constants.dart';
import 'package:messanger/messanger/home.dart';

import 'package:messanger/messanger/login.dart';
import 'package:messanger/messanger/register.dart';
import 'package:messanger/news_cubit%20copy/news_cubit.dart';
import 'package:messanger/todo_cubit%20copy/cubit.dart';

import 'CounterApp/counter/Counter_Screen.dart';
import 'CounterApp/counter/cubit/cubit.dart';
import 'NewsApp copy/news_layout/News_home_layout.dart';
import 'NewsApp/news_layout/News_home_layout.dart';
import 'ToDoApp copy/tasks/tasks_screen.dart';
import 'ToDoApp copy/todo_layout/todo_layout.dart';

import 'bmi/bmi.dart';
import 'components/bloc_observer.dart';
import 'network/local/cash_helper.dart';
import 'network/remote/dio_helper.dart';
import 'news_cubit/news_cubit.dart';
import 'news_cubit/news_state.dart';

void main() {
  runApp(MyApp());
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  //  await CashHelper.init();
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
          BlocProvider(
            create: (context) => NewsCubit(NewsInitialState())
              ..getBusiness()
              ..getSports()
              ..getScience(),
          ),
          BlocProvider(create: (BuildContext context) => todocubit()),
          BlocProvider(
              create: (BuildContext context) => newscubic()
                ..getbusiness()
                ..getsciences()
                ..getsport()),
        ],
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: newslayout()));
  }
}
