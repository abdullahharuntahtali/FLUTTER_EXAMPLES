import 'package:flutter/material.dart';
import 'package:sayfa_gecis_uygulamasi/Kisiler.dart';
import 'package:sayfa_gecis_uygulamasi/SayfaB.dart';

class SayfaA extends StatefulWidget {

  Kisiler kisi;


  SayfaA({required this.kisi});

  @override
  _SayfaAState createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("Sayfa B' ya git."),
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SayfaB()));
                }

            ),
          Text("İsim : ${widget.kisi.isim}"),
          Text("Yaş : ${widget.kisi.yas}"),
          Text("Boy : ${widget.kisi.boy}"),
          Text("Bekarmı : ${widget.kisi.bekarMi}"),
          ],
        ),
      ),

    );
  }
}
