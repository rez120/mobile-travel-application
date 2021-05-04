import 'package:app/screens/loading_screen/loading_screen.dart';
import 'package:app/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: LoadingScreen(),
      home: LoginScreen(),
    );
  }
}
