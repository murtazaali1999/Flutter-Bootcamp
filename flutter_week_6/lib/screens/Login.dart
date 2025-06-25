import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/About.dart';
import 'package:flutter_application_1/screens/Information.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<String> logins = ["skibidi", "toilet", "work"];
  final TextEditingController _controller = TextEditingController();

  void _addLogin() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      logins.add(text);
      _controller.clear();
    });
  }

  List<String> getLoginItems() {
    return logins;
  }

  TextEditingController getTextController() {
    return _controller;
  }

  void handleAddLogin() {
    _addLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Login"),
        leading: Icon(Icons.login),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(fillColor: Colors.orange),
                ),
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(fillColor: Colors.orange),
                ),
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(fillColor: Colors.orange),
                ),
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(fillColor: Colors.orange),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Login Button clicked!");
                    },
                    child: Text("Login"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.blueAccent,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.attach_money, color: Colors.white),
            label: "Home",
            enabled: true,
          ),
          NavigationDestination(icon: Icon(Icons.add_comment), label: "About"),
          NavigationDestination(
            icon: Icon(Icons.comment),
            label: "Information",
          ),
          NavigationDestination(icon: Icon(Icons.login), label: "Login"),
        ],
        selectedIndex: 3,
        onDestinationSelected: (int tab) {
          if (tab == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          } else if (tab == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutScreen()),
            );
          } else if (tab == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InformationScreen()),
            );
          } else if (tab == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
      ),
    );
  }
}
