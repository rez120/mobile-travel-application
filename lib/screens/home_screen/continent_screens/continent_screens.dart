import 'package:flutter/material.dart';

class ContinentScreen extends StatelessWidget {
  final destinations;
  ContinentScreen({this.destinations});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text(destinations[0].nameAndCountry),
      ),
    );
  }
}
