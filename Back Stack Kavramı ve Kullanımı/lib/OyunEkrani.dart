import 'package:back_state_kullanimi/SonucEkrani.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget {
  const OyunEkrani({Key? key}) : super(key: key);

  @override
  _OyunEkraniState createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oyun Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
                child: Text("OYUN BİTTİ"),
                onPressed: (){
                  //PushReplacement sayesinde bu sayfa back stackden silindi yani geçtiş yaptığı
                  // sayfadan geri tuşuna basarsa bu sayfaya eğil bu sayfadan önceki sayfaya geçiş yapar
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SonucEkrani()));
                }),
          ],
        ),
      ),

    );
  }
}
