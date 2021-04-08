import 'package:app/helpers/destination_sorter.dart';
import 'package:app/models/destination.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:linkify/linkify.dart';

import '../../bottomNavBar.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var rawDestinations;
  Destination destination;
  @override
  void initState() {
    super.initState();
    getData();
    // for (var i; i < destinationList.length; i++) {
    //   destinationSorter(destinationList[i]);
    // }
  }

  getData() async {
    var url = "http://10.0.2.2:80/travel-app";
    var response = await http.get(url);

    dom.Document document = parser.parse(response.body);
    print(document);
    rawDestinations = document.querySelectorAll(".card");

    print("data Collected");
    // print(destinations);
    // print(destinations[1].innerHtml);
    var nameAndCountry,
        company,
        flightPrice,
        hotelPrice,
        continent,
        thumbnail,
        description;
    for (var i = 0; i < rawDestinations.length; i++) {
      nameAndCountry =
          rawDestinations[i].querySelector(".card--nameandcountry").innerHtml;
      company = rawDestinations[i].querySelector(".card--company").innerHtml;
      flightPrice =
          rawDestinations[i].querySelector(".card--flightprice").innerHtml;

      hotelPrice =
          rawDestinations[i].querySelector(".card--hotelprice").innerHtml;
      continent =
          rawDestinations[i].querySelector(".card--continent").innerHtml;
      thumbnail = "http://10.0.2.2:80/travel-app/" +
          rawDestinations[i]
              .querySelector(".thumbnail--adress")
              .innerHtml
              .toString();

      description =
          rawDestinations[i].querySelector(".card--description").innerHtml;

      destinationList.add(Destination(
          nameAndCountry: nameAndCountry,
          company: company,
          flightPrice: flightPrice,
          hotelPrice: hotelPrice,
          continent: continent,
          thumbnail: thumbnail,
          description: description));
    }
    await destinationSorter(destinationList);
    print("Data Collected.");
    // print(asianDestinations[0].nameAndCountry);

    Route route = MaterialPageRoute(builder: (context) => BottomNavBar());
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
          "http://10.0.2.2:80/travel-app/assets/images/toronto.jpg"),
    );
  }
}
