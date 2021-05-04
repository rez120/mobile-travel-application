import 'package:app/screens/loading_screen/loading_screen.dart';
import 'package:flutter/material.dart';

import '../../bottomNavBar.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Text("Authentication"),
                  Container(
                    margin: EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey,
                    ),
                    child: TextField(
                      controller: _usernameController,
                      // autofocus: true,
                      textInputAction: TextInputAction.done,

                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Enter Username or Email",
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey,
                    ),
                    child: TextField(
                      controller: _usernameController,
                      // autofocus: true,
                      textInputAction: TextInputAction.done,

                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Enter Password",
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => LoadingScreen());
                              Navigator.pushReplacement(context, route);
                            },
                            child: Text("Login")),
                        SizedBox(width: 10.0),
                        ElevatedButton(onPressed: () {}, child: Text("Signup")),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
