import 'package:app/models/destination.dart';
import 'package:app/screens/transaction_screen/transaction_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;
  final String type;
  DetailScreen({this.destination, this.type});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            spreadRadius: 2.0,
                            blurRadius: 6.0),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: NetworkImage(destination.thumbnail),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.nameAndCountry,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(destination.continent,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0))
                      ],
                    ),
                    bottom: 14.0,
                    left: 14.0,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: 2.0,
                        blurRadius: 6.0),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      destination.nameAndCountry,
                      style: TextStyle(fontSize: 22.0),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      destination.company,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      destination.description,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    type == "flight" || type == "destination"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Flight Price: " + destination.flightPrice,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    // flights.add(destination);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TransactionScreen(
                                                  destination: destination,
                                                  isFlight: true,
                                                )));
                                  },
                                  child: Text("Purchase"))
                            ],
                          )
                        : SizedBox(height: 2.0),
                    SizedBox(
                      height: 15.0,
                    ),
                    type == "hotel" || type == "destination"
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hotel Price: " + destination.hotelPrice,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TransactionScreen(
                                                  destination: destination,
                                                  isFlight: false,
                                                )));
                                  },
                                  child: Text("Purchase"))
                            ],
                          )
                        : SizedBox(height: 2.0),
                  ],
                ),
              ),
            ],
          ),
        )),
      )),
    );
  }
}
