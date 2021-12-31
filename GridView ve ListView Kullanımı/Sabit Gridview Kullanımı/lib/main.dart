import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2, //1 satırda kaç item olacak
        childAspectRatio: 2/1 , //Her bir item  2 genişliğinde 1 yüksekliğinde
        children: [
          GestureDetector(
            onTap: (){
              print("Güneşe Tıklandı");
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_sunny),
                  Text("Güneş"),

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print("Aya Tıklandı");
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.brightness_2),
                  Text("Ay"),

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print("Yıldıza Tıklandı");
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star),
                  Text("Yıldız"),

                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
