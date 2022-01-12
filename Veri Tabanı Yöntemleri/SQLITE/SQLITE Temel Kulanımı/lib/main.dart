import 'package:flutter/material.dart';
import 'package:sqlite_kullanimi/KisilerDatabaseAccessObject.dart';

import 'Kisiler.dart';

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

  Future<void> kisileriGoster() async{

    var liste = await Kisilerdao().tumKisiler();

    for(Kisiler k in liste){

      print("*****************************");
      print("Kişi Adı : ${k.kisi_id}");
      print("Kişi Adı : ${k.kisi_ad}");
      print("Kişi Adı : ${k.kisi_yas}");

    }

  }
  Future<void> ekle() async{

    await Kisilerdao().kisiEkle("Ece", 54);

  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ekle();
    kisileriGoster();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}
