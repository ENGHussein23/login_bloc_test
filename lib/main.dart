import 'package:flutter/material.dart';
import 'package:login_bloc_test/business_logic/constants/colors.dart';
import 'package:login_bloc_test/presentation/pages/login_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:login_bloc_test/business_logic/cubit/auth_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test',
      theme: ThemeData(primarySwatch: Colors.indigo,),
      home:  Login_page(),
    );
  }
}


