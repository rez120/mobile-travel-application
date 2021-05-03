import 'package:app/helpers/purchases.dart';
import 'package:flutter/material.dart';

class DealsScreen extends StatefulWidget {
  @override
  _DealsScreenState createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  @override
  void initState() {
    print(flights);
    print(hotels);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Purchases"),
            Text("your flights"),
            Column(
              children: flights
                  .map((e) => PurchaseCard(
                      icon: Icon(Icons.flight),
                      destination: e,
                      flight: 1,
                      remove: () {
                        setState(() {
                          flights.remove(e);
                        });
                      }))
                  .toList(),
            ),
            Text("your hotel reservation"),
            Column(
              children: hotels
                  .map((e) => PurchaseCard(
                      icon: Icon(Icons.hotel),
                      destination: e,
                      flight: 0,
                      remove: () {
                        setState(() {
                          hotels.remove(e);
                        });
                      }))
                  .toList(),
            ),
          ],
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
            trailing: IconButton(icon: Icon(Icons.delete), onPressed: remove)),
      ),
    );
  }
}
