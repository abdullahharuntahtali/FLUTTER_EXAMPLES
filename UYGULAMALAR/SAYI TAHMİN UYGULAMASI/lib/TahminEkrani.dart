import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmini_uygulamasi/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin=TextEditingController();
  int rastgeleSayi=0;
  int kalanHak=3;
  String yonlendirme="";


  @override
  void initState() {

    super.initState();
    rastgeleSayi=Random().nextInt(101); //0-100 arası
    print("Rastgele Sayımız : $rastgeleSayi");

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Kalan Hak : $kalanHak",style : TextStyle(color: Colors.pink,fontSize: 30),),
            Text("Yardım : $yonlendirme",style : TextStyle(color: Colors.black54,fontSize: 24),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 80,
              child: RaisedButton(
                child: Text("TAHMİN ET",style: TextStyle(fontSize: 20),),
                color: Colors.pink,
                textColor: Colors.white,
                onPressed: (){

                  setState(() {
                    kalanHak-=1;

                  });
                  int tahmin=int.parse(tfTahmin.text);

                  if(tahmin==rastgeleSayi){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true,)),
                    );
                    return; //Butonun çalışmasını durdurduk
                  }
                  if(tahmin> rastgeleSayi){
                    setState(() {
                      yonlendirme="Tahmini Azalt";

                    });
                  }
                  if(tahmin< rastgeleSayi){
                    setState(() {
                      yonlendirme="Tahmini Artır";

                    });
                  }
                  if(kalanHak==0){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false,)),
                    );
                    return; //
                  }
                  tfTahmin.text="";
                  tfTahmin.
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
