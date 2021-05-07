import 'package:app/helpers/info.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String message = "";
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordRepeatController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Settings ",
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "New Username: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(18.0),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[350],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Enter New Username",
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        )),
                    controller: _usernameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_usernameController.text != "") {
                          username = _usernameController.text;
                          setState(() {
                            message = "Changes successfully applied";
                          });
                        }
                      },
                      child: Text("Change Username")),
                ),
                SizedBox(height: 18.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Change Password",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(18.0),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[350],
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Enter Current Password",
                        icon: Icon(
                          Icons.book,
                          color: Colors.grey,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(18.0),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[350],
                  ),
                  child: TextField(
                    controller: _passwordRepeatController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Enter New Password",
                        icon: Icon(
                          Icons.book,
                          color: Colors.grey,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_passwordController.text ==
                                _passwordRepeatController.text &&
                            _passwordController.text != "") {
                          setState(() {
                            password = _passwordRepeatController.text;
                            message = "Settings successfully applied";
                          });
                        }
                      },
                      child: Text("Change Password")),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    "$message",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
