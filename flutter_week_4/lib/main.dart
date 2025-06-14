import 'package:flutter/material.dart';

void main() {
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/bg.jpg",
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
          SizedBox(
            child: Center(
              child: ListView.builder(
                itemCount: work.length,
                itemBuilder: (context, index) {
                  return Text(work[index]);
                },
              ),
            ),
            height: 300,
          ),
          Container(
            margin: EdgeInsetsGeometry.directional(top: 120),
            child: TextField(
              onSubmitted: (value) {
                _addText();
              },
              controller: _controller,
              decoration: InputDecoration(
                hintText: "ADD TEXT HERE",
                labelText: "Text",
                fillColor: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsGeometry.directional(top: 350),
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/VI.png",
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                  ),
                  Center(
                    child: Row(children: [Text("HOMEY"), Text("IM A ROW")]),
                  ),
                  Center(
                    child: Column(
                      children: [Text("BROSKEY"), Text("IM A COL")],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: FloatingActionButton(
          onPressed: _addText,
          tooltip: 'Increment',
          backgroundColor: const Color.fromARGB(255, 94, 180, 206),
          hoverColor: Colors.pinkAccent,
          mouseCursor: MouseCursor.uncontrolled,
          child: Text("Add Content"),
        ),
      ),
    );
  }
}
