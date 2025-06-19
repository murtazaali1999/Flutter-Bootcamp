import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/About.dart';
import 'package:flutter_application_1/screens/Complain.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final List<String> work = ["skibidi", "toilet", "work"];
  final TextEditingController _controller = TextEditingController();

  void _addText() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      work.add(text);
      _controller.clear();
    });
  }

  List<String> getWorkItems() {
    return work;
  }

  TextEditingController getTextController() {
    return _controller;
  }

  void handleAddText() {
    _addText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
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
          NavigationDestination(
            icon: Icon(Icons.question_mark_sharp),
            label: "Complain",
          ),
        ],
        selectedIndex: 0,
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
              MaterialPageRoute(builder: (context) => ComplainScreen()),
            );
          }
        },
      ),
    ); // You can replace this with actual UI later
  }
}
