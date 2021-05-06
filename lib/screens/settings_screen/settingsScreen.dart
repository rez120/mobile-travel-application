import 'package:app/helpers/info.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String message = "dgfg";
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordRepeatController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text("Settings: "),
              Text("new username: "),
              TextField(
                controller: _usernameController,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_usernameController.text != "") {
                      username = _usernameController.text;
                      setState(() {
                        message = "Settings successfully applied";
                      });
                    }
                  },
                  child: Text("Change Username")),
              Text("Change Password"),
              TextField(
                controller: _passwordController,
              ),
              TextField(
                controller: _passwordRepeatController,
              ),
              ElevatedButton(
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
              Text(
                "$message",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
