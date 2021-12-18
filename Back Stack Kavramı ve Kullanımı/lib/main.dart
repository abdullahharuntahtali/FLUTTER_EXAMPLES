import 'package:back_state_kullanimi/OyunEkrani.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
                child: Text("OYUNA BAŞLA"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OyunEkrani()));
                }),
          ],
        ),
      ),

    );
  }
}
