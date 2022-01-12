import 'package:flutter/material.dart';
import 'package:sqlite_foreign_kullanimi/Filmler.dart';
import 'package:sqlite_foreign_kullanimi/Filmlerdao.dart';

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

  Future<void> goster() async {

    var list = await Filmlerdao().tumFilmler();

    int sayac = 1;
    for( Filmler f in list){

      print("**********$sayac. Film**********");
      print("Film ID : ${f.film_id}");
      print("Film Adı : ${f.film_ad}");
      print("Film Yılı : ${f.film_yil}");
      print("Film Resmi : ${f.film_resim}");
      print("Film Kategorisi : ${f.kategori.kategori_ad}");
      print("Film Yönetmeni : ${f.yonetmen.yonetmen_ad}");

      sayac++;

    }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goster();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANA SAYFA"),
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
