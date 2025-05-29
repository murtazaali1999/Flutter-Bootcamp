import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String name = "myname";
int number = 44;
double height = 5.11;
List myList = ["skibidi", "toilet"]; //array
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: AlignmentGeometry.xy(0, 0), //0,0 is center
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 40, 26, 80),
          ),
          child: Text(
            "Counter--> $_counter",
            style: TextStyle(color: Colors.redAccent, fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          backgroundColor: Colors.amber,
          hoverColor: Colors.pinkAccent,
          child: Text("Press Me"),
        ),
      ),
    );
  }
}
