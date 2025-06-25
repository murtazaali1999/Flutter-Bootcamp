import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/About.dart';
import 'package:flutter_application_1/screens/Information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final List<String> signups = ["skibidi", "toilet", "work"];
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _email_controller = TextEditingController();

  void _addSignup(BuildContext context) async {
    print(2);

    final email = _email_controller.text;
    final password = _password_controller.text;

    print(email);
    print(password);

    if (email.isEmpty || password.isEmpty) return;
    //add additional verification here
    print(3);

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(4);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Successfully Created User")));
    print(5);
  }

  List<String> getSignupItems() {
    return signups;
  }

  TextEditingController getPasswordController() {
    return _password_controller;
  }

  TextEditingController getEmailController() {
    return _email_controller;
  }

  void handleSignup(BuildContext context) {
    print(1);
    _addSignup(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Signup"),
        leading: Icon(Icons.person_add),
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
                  controller: _email_controller,
                ),
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(fillColor: Colors.orange),
                  controller: _password_controller,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Signup Button clicked!");
                      handleSignup(context);
                    },
                    child: Text("Signup"),
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
          NavigationDestination(icon: Icon(Icons.person_add), label: "Signup"),
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
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          }
        },
      ),
    );
  }
}
