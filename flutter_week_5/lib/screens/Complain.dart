import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/About.dart';
import 'package:flutter_application_1/screens/Information.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({super.key});

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  final List<String> complaints = ["skibidi", "toilet", "work"];
  final TextEditingController _controller = TextEditingController();

  void _addComplaint() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      complaints.add(text);
      _controller.clear();
    });
  }

  List<String> getComplaintItems() {
    return complaints;
  }

  TextEditingController getTextController() {
    return _controller;
  }

  void handleAddComplaint() {
    _addComplaint();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Complain"),
        leading: Icon(Icons.question_mark_sharp),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsetsGeometry.all(30),
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
                  decoration: InputDecoration(fillColor: Colors.orange,),
                ),
              ),
            
              Container(
                margin: EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Button clicked!");
                    },
                    child: Text("Submit"),
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
    );
  }
}
