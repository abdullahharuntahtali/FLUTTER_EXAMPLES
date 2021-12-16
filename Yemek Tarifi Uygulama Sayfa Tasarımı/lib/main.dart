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
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Yemek Tarifi'),
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

    var ekranBilgisi=MediaQuery.of(context);
    final ekranYuksekligi=ekranBilgisi.size.height;
    final ekranGenisligi=ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: ekranGenisligi,
                child: Image.asset("resimler/yemekresim.jpeg")
            ),
            Row( //2 butonu yanyana getirmek için satır içine aldık
              children: [
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: FlatButton(
                        child: Yazi("Beğen", ekranGenisligi/25),
                        onPressed: (){
                        print("Beğenildi...");
                        },
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
                
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: FlatButton(
                      child: Yazi("Yorum Yap", ekranGenisligi/25),
                      onPressed: (){
                        print("Yorum Yapıldı...");
                      },
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(ekranGenisligi/100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Köfte",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: ekranGenisligi/20,
                    ),
                  ),
                  Row(
                    children: [
                      Yazi("IZGARA ÜZERİNDE PİŞİRİME UYGUN", ekranGenisligi/25),
                      Spacer(),
                      Yazi("I12 ARALIK", ekranGenisligi/25),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(ekranYuksekligi/100),
              child: Yazi("Köfte harcını hazırlamak için, soğanları rendeleyin ve maydanozları ince ince kıyın. İsterseniz, bir diş sarımsak da ekleyebilirsiniz."
                  "Soğan, maydanoz, kıyma, yumurta, zeytinyağı ve tuzu bir kaba alıp iyice yoğurun. Bu sırada istediğiniz baharatları da ekleyerek yoğurmaya devam edin."
                  "Hazırladığınız harcın üzerini streç filmle kapatarak yarım saat buzdolabında dinlendirin."
                  "Ardından harçtan ceviz büyüklüğünde parçalar koparıp yuvarlayın. 1 cm olacak şekilde üzerine bastırarak yassılaştırın.",
                  ekranGenisligi/25
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Yazi extends StatelessWidget {

  String icerik;
  double yaziBoyut;

  Yazi(this.icerik, this.yaziBoyut);

  @override
  Widget build(BuildContext context) {
    return Text(
      icerik,
      style: TextStyle(
        fontSize: yaziBoyut,
      ),
    );
  }
}

