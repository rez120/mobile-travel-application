import 'package:flutter/material.dart';

class ContinentScreen extends StatelessWidget {
  final x;
  ContinentScreen({this.x});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text(x),
      ),
    );
  }
}
