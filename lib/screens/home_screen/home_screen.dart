import 'package:app/helpers/destination_sorter.dart';
import 'package:app/helpers/info.dart';
import 'package:app/screens/home_screen/continent_screens/continent_screens.dart';
import 'package:app/screens/search_screen/search_screen.dart';
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
  TextEditingController _textEditingController = new TextEditingController();
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
          preferredSize: Size.fromHeight(195.0),
          child: Column(
            children: [
              Text(
                "Travel App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                "Welcome " + username,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.grey[350],
                ),
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: TextField(
                  controller: _textEditingController,
                  // autofocus: true,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    // FocusScope.of(context).requestFocus(new FocusNode());
                    print(_textEditingController.text);
                    if (_textEditingController.text != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                    query: _textEditingController.text,
                                  )));
                    }
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Search",
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 60.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: continents.length,
                  itemBuilder: (context, index) => tabItemCard(index),
                ),
              )
            ],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                continents[index],
                style: TextStyle(
                  fontSize: 16.0,
                  color: _selectedIndex == index ? Colors.black : Colors.grey,
                ),
              ),
              SizedBox(height: 2.0),
              Container(
                color:
                    _selectedIndex == index ? Colors.black : Colors.transparent,
                width: 30.0,
                height: 3.0,
              ),
            ],
          ),
        ),
      );
}
