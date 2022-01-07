import 'package:bottom_navigation/SayfaBir.dart';
import 'package:bottom_navigation/SayfaIki.dart';
import 'package:bottom_navigation/SayfaUc.dart';
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
        primarySwatch: Colors.purple,
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

  var sayfaListe =  [SayfaBir(),SayfaIki(),SayfaUc()];
  int secilenIndeks=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: sayfaListe[secilenIndeks],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //Bu sayede İç boşluğu sıfırladık
          children: [
            DrawerHeader(
              child: Text("Başlık Tasarımı",style: TextStyle(color: Colors.white,fontSize: 30),),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              title: Text("Sayfa Bir"),
              onTap: (){
                setState(() {
                  secilenIndeks=0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Sayfa İki",style: TextStyle(color: Colors.pink),),
              onTap: (){
                setState(() {
                  secilenIndeks=1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Sayfa Üç"),
              leading: Icon(Icons.looks_3,color: Colors.orange,),
              onTap: (){
                setState(() {
                  secilenIndeks=2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
