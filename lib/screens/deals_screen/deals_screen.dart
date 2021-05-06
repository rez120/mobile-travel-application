import 'package:app/helpers/purchases.dart';
import 'package:flutter/material.dart';

class DealsScreen extends StatefulWidget {
  @override
  _DealsScreenState createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.0,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Purchases",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 10.0),
              Container(
                child: Text(
                  "Your Flight Reservations",
                  style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
                ),
              ),
              Column(
                children: flights.length != 0
                    ? flights
                        .map((e) => PurchaseCard(
                            icon: Icon(Icons.flight),
                            destination: e,
                            flight: 1,
                            remove: () {
                              setState(() {
                                flights.remove(e);
                              });
                            }))
                        .toList()
                    : [Text("No flights Scheduled.")],
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Your hotel reservation",
                style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
              ),
              Column(
                children: hotels.length != 0
                    ? hotels
                        .map((e) => PurchaseCard(
                            icon: Icon(Icons.hotel),
                            destination: e,
                            flight: 0,
                            remove: () {
                              setState(() {
                                hotels.remove(e);
                              });
                            }))
                        .toList()
                    : [Text("No Hotel reservations.")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget purchaseCard(icon, destination, flight, remove) =>
//
class PurchaseCard extends StatelessWidget {
  final icon;
  final destination;
  final flight;
  final Function remove;

  const PurchaseCard(
      {Key key, this.icon, this.destination, this.flight, this.remove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: icon,
            ),
            tileColor: Colors.grey[350],
            title: Text(destination.nameAndCountry),
            subtitle: flight == 1
                ? Text(destination.flightPrice)
                : Text(destination.hotelPrice),
            trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[800],
                ),
                onPressed: remove)),
      ),
    );
  }
}
