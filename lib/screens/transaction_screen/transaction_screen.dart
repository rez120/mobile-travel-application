import 'package:app/helpers/purchases.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  final destination;
  final isFlight;

  TransactionScreen({this.destination, this.isFlight});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(18.0),
            child: Column(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Payment info: ",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Company Name: ${destination.company}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  isFlight == true
                      ? Text(
                          "Service or product: Flight reservation for ${destination.nameAndCountry}",
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        )
                      : Text(
                          "Service or product: Hotel reservation for ${destination.nameAndCountry}",
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                  SizedBox(height: 5.0),
                  isFlight == true
                      ? Text(
                          "Total Payment: ${destination.flightPrice}",
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        )
                      : Text(
                          "Total Payment: ${destination.hotelPrice}",
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                ]),
                SizedBox(height: 15.0),
                Container(
                    child: Text(
                  "Enter required Information to complete transaction",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Card Number",
                  style: TextStyle(fontSize: 18.0),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 16, 0, 10),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[350],
                        ),
                        child: TextField(
                          // autofocus: true,
                          textInputAction: TextInputAction.done,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 16, 0, 10),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[350],
                        ),
                        child: TextField(
                          // autofocus: true,
                          textInputAction: TextInputAction.done,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 16, 0, 10),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[350],
                        ),
                        child: TextField(
                          // autofocus: true,
                          textInputAction: TextInputAction.done,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 16, 0, 10),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[350],
                        ),
                        child: TextField(
                          // autofocus: true,
                          textInputAction: TextInputAction.done,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Valid Untill",
                  style: TextStyle(fontSize: 18.0),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[350],
                        ),
                        child: TextField(
                          // autofocus: true,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "YEAR",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[350],
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          // autofocus: true,
                          textInputAction: TextInputAction.done,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "MONTH",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "CVV",
                  style: TextStyle(fontSize: 18.0),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[350],
                  ),
                  child: TextField(
                    // autofocus: true,
                    textInputAction: TextInputAction.done,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Text(
                  "Card Holder",
                  style: TextStyle(fontSize: 18.0),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[350],
                  ),
                  child: TextField(
                    // autofocus: true,
                    textInputAction: TextInputAction.done,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (isFlight) {
                              flights.add(destination);
                              print("flighted");
                            } else {
                              hotels.add(destination);
                              print("hoteled");
                            }
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Pay",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
