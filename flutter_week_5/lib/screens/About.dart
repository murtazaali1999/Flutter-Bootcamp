import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/Complain.dart';
import 'package:flutter_application_1/screens/Information.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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

  // This function can be used in UI to retrieve work list
  List<String> getWorkItems() {
    return work;
  }

  // This function can be used in UI to get the controller
  TextEditingController getTextController() {
    return _controller;
  }

  // This function exposes addText in a callable way (for button press)
  void handleAddText() {
    _addText();
  }

  @override
  Widget build(BuildContext context) {
    // Return an empty Container to avoid UI rendering
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("About"),
        leading: Icon(Icons.add_comment),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Row(children: [Text("Alpha", style: TextStyle(fontSize: 37))]),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                    "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                    "It has survived not only five centuries, but also",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // margin-top
            Row(children: [Text("Omega", style: TextStyle(fontSize: 37))]),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                    "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                    "It has survived not only five centuries, but also",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // margin-top
            Row(children: [Text("Ultron", style: TextStyle(fontSize: 37))]),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                    "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                    "It has survived not only five centuries, but also",
                  ),
                ),
              ],
            ),
          ],
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
