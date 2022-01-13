import 'package:bayrak_uygulamasi/QuizEkrani.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("QUİZE HOŞGELDİNİZ",style: TextStyle(fontSize: 30),),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text("BAŞLA"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizEkrani()));

                },
              ),
            ),


          ],
        ),
      ),

    );
  }
}
