import 'package:flutter/material.dart';
import 'package:tabs_kullanimi/Sayfa1.dart';
import 'package:tabs_kullanimi/Sayfa2.dart';
import 'package:tabs_kullanimi/Sayfa3.dart';

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
        primarySwatch: Colors.deepPurple,
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(text: "Bir",),
              Tab(icon: Icon(Icons.looks_two,color: Colors.cyanAccent,),),
              Tab(text: "Üç",icon: Icon(Icons.looks_3,),),
            ],
            indicatorColor:Colors.blue ,
            labelColor: Colors.orange,
          ),
        ),
        body: TabBarView(
          children: [
            Sayfa1(),
            Sayfa2(),
            Sayfa3(),
          ],

        ),
      ),
    );
  }
}
