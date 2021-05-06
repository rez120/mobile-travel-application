import 'package:app/helpers/destination_sorter.dart';
import 'package:app/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final query;
  SearchScreen({this.query});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var filteredDestinations = [];
  @override
  void initState() {
    // if (allDestinations[0]
    //     .nameAndCountry
    //     .toString()
    //     .toLowerCase()
    //     .contains(widget.query.toString().toLowerCase())) {
    //   print("true");
    //   print(allDestinations[0].nameAndCountry);
    //   var a = "trtr";
    // }
    _filterData();

    super.initState();
  }

  _filterData() async {
    for (var i = 0; i < allDestinations.length; i++) {
      if (allDestinations[i]
          .nameAndCountry
          .toString()
          .toLowerCase()
          .contains(widget.query.toString().toLowerCase())) {
        filteredDestinations.add(allDestinations[i]);
      }
    }
    for (var i = 0; i < filteredDestinations.length; i++) {
      print(filteredDestinations[i].nameAndCountry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[800],
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Search Results",
          style: TextStyle(color: Colors.grey[800]),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: filteredDestinations
                .map<Widget>((e) => _searchCard(
                    e,
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  destination: e,
                                )))))
                .toList()),
      ),
    );
  }

  Widget _searchCard(destination, function) => GestureDetector(
        onTap: function,
        child: Container(
          height: 190,
          width: (MediaQuery.of(context).size.width),
          padding: EdgeInsets.all(10.0),
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                left: 130,
                top: 10.0,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    height: 150,
                    // width: .0,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0),
                      ],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.grey[350],
                    ),
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            // width: 180.0,
                            child: Text(
                              destination.nameAndCountry,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 200,
                            child: Text(
                              destination.description.toString(),
                              style: TextStyle(),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  height: 180.0,
                  width: 150.0,
                  image: NetworkImage(destination.thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );
}
