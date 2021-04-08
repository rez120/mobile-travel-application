import 'package:app/helpers/destination_sorter.dart';
import 'package:app/screens/home_screen/continent_screens/continent_screens.dart';
import 'package:flutter/material.dart';

List screens = [
  Container(
    height: 200,
    width: 200,
    color: Colors.pink,
  ),
  Container(
    height: 200,
    width: 200,
    color: Colors.blue,
  ),
  Container(
    height: 200,
    width: 200,
    color: Colors.grey,
  ),
];
List continents = <String>[
  "Asia",
  "Europe",
  "North America",
  "South America",
  "Oceana",
  "Africa",
  "Antarctica"
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  _continentSelector(continent) {
    switch (continent) {
      case "Asia":
        return asianDestinations;
        break;
      case "Europe":
        return europeanDestinations;
        break;
      case "Africa":
        return africanDestinations;
        break;
      case "North America":
        return northAmericanDestinations;
        break;
      case "South America":
        return southAmericanDestinations;
        break;
      case "Antarctica":
        return antarcticanDestinations;
        break;
      case "Oceana":
        return oceanianDestinations;
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: continents.length,
            itemBuilder: (context, index) => tabItemCard(index),
          ),
        ),
        body: ContinentScreen(
          destinations: _continentSelector(continents[_selectedIndex]),
        ),
      ),
    );
  }

  Widget tabItemCard(int index) => GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(continents[index]),
              Container(
                color:
                    _selectedIndex == index ? Colors.black : Colors.transparent,
                width: 20.0,
                height: 3.0,
              ),
            ],
          ),
        ),
      );
}
