import 'package:app/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

class ContinentScreen extends StatefulWidget {
  final destinations;

  ContinentScreen({this.destinations});

  @override
  _ContinentScreenState createState() => _ContinentScreenState();
}

class _ContinentScreenState extends State<ContinentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.0),
          Text(
            "Destinations",
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30.0),
          // Row(
          //     // crossAxisAlignment: CrossAxisAlignment.center,
          //     children: widget.destinations
          //         .map<Widget>((e) => destinationCard(
          //               e,
          //               context,
          //               () => Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => DetailScreen(
          //                             destination: e,
          //                           ))),
          //             ))
          //         .toList()),

          Container(
            height: 320.0,
            child: ListView.builder(
                itemCount: widget.destinations.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => destinationCard(
                      widget.destinations[index],
                      context,
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    destination: widget.destinations[index],
                                    type: "destination",
                                  ))),
                    )),
          ),

          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.grey,
          //     borderRadius: BorderRadius.circular(25.0),
          //   ),
          //   child: Column(
          //     children: widget.destinations
          //         .map((e) => ListTile(title: Text("fgf")))
          //         .toList(),
          //   ),
          // ),
          Text(
            "Latest Flight Offers",
            style: TextStyle(fontSize: 18.0),
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.destinations
                    .map<Widget>((e) => ListTile(
                          leading: Icon(Icons.flight),
                          title: Text(e.company),
                          subtitle: Text("Flight price: ${e.flightPrice}"),
                          trailing: Text(e.nameAndCountry),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        destination: e,
                                        type: "flight",
                                      ))),
                        ))
                    .toList()),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Latest Reservation Offers",
            style: TextStyle(fontSize: 18.0),
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.destinations
                    .map<Widget>((e) => ListTile(
                          leading: Icon(Icons.hotel),
                          title: Text(e.company),
                          subtitle: Text("Hotel price: ${e.hotelPrice}"),
                          trailing: Text(e.nameAndCountry),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        destination: e,
                                        type: "hotel",
                                      ))),
                        ))
                    .toList()),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    ));
  }

  Widget destinationCard(var destination, context, tapAction) =>
      GestureDetector(
        onTap: tapAction,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Container(
            // color: Colors.blue,

            height: 300.0,
            width: (MediaQuery.of(context).size.width) * 0.70,
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
                      color: Colors.grey[350],
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
                    color: Colors.grey,
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
