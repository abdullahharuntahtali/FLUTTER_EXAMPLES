import 'package:flutter/material.dart';
import 'package:sayi_tahmini_uygulamasi/TahminEkrani.dart';

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
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {

  @override
  State<AnaSayfa> createState() => _AnaSayfa();
}

class _AnaSayfa extends State<AnaSayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Tahmin Oyunu",style : TextStyle(color: Colors.black54,fontSize: 38),),
            Image.asset("resimler/zar.png"),
            SizedBox(
              width: 300,
              height: 80,
              child: RaisedButton(
                child: Text("OYUN BAŞLAT",style: TextStyle(fontSize: 20),),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TahminEkrani()),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
