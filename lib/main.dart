// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:messanger/constants.dart';
import 'package:messanger/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
  login()  );
  }
}
