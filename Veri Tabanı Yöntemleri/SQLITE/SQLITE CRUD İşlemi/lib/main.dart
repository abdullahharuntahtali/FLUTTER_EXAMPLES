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
      print("Kişi ID : ${k.kisi_id}");
      print("Kişi Adı : ${k.kisi_ad}");
      print("Kişi Adı : ${k.kisi_yas}");

    }

  }
  Future<void> ekle() async{

    await Kisilerdao().kisiEkle("Ece", 54);

  }
  Future<void> sil() async{

    await Kisilerdao().kisiSil(3);

  }

  Future<void> guncelle() async{

    await Kisilerdao().kisiGuncelle(1, "Yeni", 99);

  }

  Future<void> kayitKontrol() async{

   int sonuc = await Kisilerdao().kayitKontrol("ahmet");
  print("Veritabanında ahmet sayısı = $sonuc");
  }

  Future<void> getir() async{

    var kisi = await Kisilerdao().kisiGetir(1);

    print("***********KİŞİ GETİR*************");
    print("Kişi ID : ${kisi.kisi_id}");
    print("Kişi Ad : ${kisi.kisi_ad}");
    print("Kişi Yaş : ${kisi.kisi_yas}");

  }
  Future<void> aramaYap() async{

    var liste = await Kisilerdao().kisiArama("e");

    for(Kisiler k in liste){

      print("***********ARAMA YAP******************");
      print("Kişi ID : ${k.kisi_id}");
      print("Kişi Adı : ${k.kisi_ad}");
      print("Kişi Adı : ${k.kisi_yas}");

    }

  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //ekle();
    //sil();
    //guncelle();
    kayitKontrol();
    getir();
    kisileriGoster();
    aramaYap();

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
