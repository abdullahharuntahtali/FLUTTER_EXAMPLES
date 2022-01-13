import 'dart:collection';

import 'package:bayrak_uygulamasi/Bayraklar.dart';
import 'package:bayrak_uygulamasi/BayraklarDatabaseAccessObject.dart';
import 'package:bayrak_uygulamasi/SonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {



  @override
  _QuizEkraniState createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {


  var sorular = <Bayraklar>[];
  var yanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogruSoru;

  var tumSecenekler = HashSet<Bayraklar>();

  int soruSayaci = 0 ;
  int dogruSayac = 0 ;
  int yanlisSayac = 0 ;

  String bayrakResimAdi = "placeholder.png";
  String buttonAYazi = "";
  String buttonBYazi = "";
  String buttonCYazi = "";
  String buttonDYazi = "";


  @override
  void initState() {
    super.initState();
    sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await BayraklarDAO().rastgele5Getir();
    soruYukle();
  }
  Future<void> soruYukle() async {

    dogruSoru = sorular[soruSayaci];

    bayrakResimAdi = dogruSoru.bayrak_resim;

    yanlisSecenekler = await BayraklarDAO().rastgele3YanlisGetir(dogruSoru.bayrak_id);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonAYazi = tumSecenekler.elementAt(0).bayrak_ad;
    buttonBYazi = tumSecenekler.elementAt(1).bayrak_ad;
    buttonCYazi = tumSecenekler.elementAt(2).bayrak_ad;
    buttonDYazi = tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {

    });

  }

  void soruSayacKontrol(){

    soruSayaci++;
    if(soruSayaci!=5){
      soruYukle();
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayisi: dogruSayac,)));
    }
  }

  void dogruKontrol(String buttonYazi){

    if(dogruSoru.bayrak_ad==buttonYazi){
      dogruSayac++;
    }else{
      yanlisSayac++;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru : $dogruSayac",style: TextStyle(fontSize: 18),),
                Text("Yanlış : $yanlisSayac",style: TextStyle(fontSize: 18),),
              ],
            ),
            soruSayaci !=5 ? Text("${soruSayaci+1}. Soru",style: TextStyle(fontSize: 30),) :
            Text("5. Soru",style: TextStyle(fontSize: 30),),
            Image.asset("resimler/$bayrakResimAdi"),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(buttonAYazi),
                onPressed: (){
                  dogruKontrol(buttonAYazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(buttonBYazi),
                onPressed: (){
                  dogruKontrol(buttonBYazi);
                  soruSayacKontrol();

                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(buttonCYazi),
                onPressed: (){
                  dogruKontrol(buttonCYazi);
                  soruSayacKontrol();

                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(buttonDYazi),
                onPressed: (){

                  dogruKontrol(buttonDYazi);
                  soruSayacKontrol();
                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}
