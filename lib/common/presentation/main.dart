import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/getit/presentation/ui/getit_page.dart';
import 'package:test_flutter/getx/presentation/ui/getx_page.dart';
import 'package:test_flutter/login/presentation/bloc/login_bloc.dart';
import 'package:test_flutter/login/presentation/ui/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      // home: _prepareLoginScreen() // BLoC
      // home: const GetXPage() // GetX
      home: const GetItPage()
    );
  }

  Widget _prepareLoginScreen() {
    return BlocProvider(
      create: (BuildContext context) {
        return LoginBloc();
      },
      child: const LoginScreen()
    );
  }
}