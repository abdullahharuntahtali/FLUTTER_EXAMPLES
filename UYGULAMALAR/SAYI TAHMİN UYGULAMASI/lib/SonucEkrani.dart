import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;

  SonucEkrani({required this.sonuc});

  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            widget.sonuc ? Text("Kazandınız",style : TextStyle(color: Colors.black54,fontSize: 38),):Text("Kaybettiniz",style : TextStyle(color: Colors.black54,fontSize: 38),) ,
            widget.sonuc ? Image.asset("resimler/mutlu.png"): Image.asset("resimler/uzgun.png"),
            SizedBox(
              width: 300,
              height: 80,
              child: RaisedButton(
                child: Text("Tekrar Dene",style: TextStyle(fontSize: 20),),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
