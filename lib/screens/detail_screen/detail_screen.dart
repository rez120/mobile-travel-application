import 'package:app/models/destination.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;
  DetailScreen({this.destination});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Text(destination.nameAndCountry),
      ],
    )));
  }
}
