import 'package:app/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

class ContinentScreen extends StatefulWidget {
  final destinations;

  ContinentScreen({this.destinations});

  @override
  _ContinentScreenState createState() => _ContinentScreenState();
}

class _ContinentScreenState extends State<ContinentScreen> {
  bool a = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !a
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      "Destinations",
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30.0),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: widget.destinations
                            .map<Widget>((e) => destinationCard(
                                  e,
                                  context,
                                  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                destination: e,
                                              ))),
                                ))
                            .toList()),
                  ],
                ),
              )
            : Text("g"));
  }

  Widget destinationCard(var destination, context, tapAction) =>
      GestureDetector(
        onTap: tapAction,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Container(
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 15.0,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    height: 135.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          destination.company,
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                            "prices starting from: ${destination.flightPrice}"),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 220.0,
                          width: 220.0,
                          image: NetworkImage(destination.thumbnail),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        bottom: 10.0,
                        child: Column(
                          children: [
                            Text(
                              destination.nameAndCountry,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
