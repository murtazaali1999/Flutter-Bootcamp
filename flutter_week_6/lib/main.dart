import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/About.dart';
import 'package:flutter_application_1/screens/Complain.dart';
import 'package:flutter_application_1/screens/Information.dart';
import 'package:flutter_application_1/screens/Login.dart';
import 'package:flutter_application_1/screens/Signup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

String name = "myname";
int number = 44;
double height = 5.11;
Map myMap = {"Key": 44}; //maps
Map<String, double> animal = {"Height": 3.55}; //typings

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(title: 'Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> work = ["skibidi", "toilet", "work"]; //array
  final TextEditingController _controller = TextEditingController();

  void _addText() {
    final text = _controller.text.trim();
    setState(() {
      print(_controller.text);
      if (text == "") {
        return;
      }
      work.add(text);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    //everything pertaining to UI changes here
    //App Bar is header
    //Body is everything else
    //floating action button is over the body, not part of the body
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
        leading: Icon(Icons.home),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Wrap(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 115, 99, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 255, 108),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
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
          NavigationDestination(icon: Icon(Icons.login), label: "Login"),
          NavigationDestination(icon: Icon(Icons.login), label: "Signup"),
        ],
        selectedIndex: 0,
        onDestinationSelected: (int tab) {
          if (tab == 0) {
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
          } else if (tab == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else if (tab == 5) {
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
