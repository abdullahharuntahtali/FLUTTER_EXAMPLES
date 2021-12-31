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

  var ulkeler=["Türkiye","Almanya","İtalya","Rusya","Fransa","Çin"]; //6 eleman var

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dinamik Liste Tasarımı")),
      ),
      body:ListView.builder(
        itemCount: ulkeler.length,
        itemBuilder: (context,index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Text(ulkeler[index]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
