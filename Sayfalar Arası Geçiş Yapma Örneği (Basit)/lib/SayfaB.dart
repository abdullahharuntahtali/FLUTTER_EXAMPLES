import 'package:flutter/material.dart';
import 'package:sayfa_gecis_uygulamasi/main.dart';

class SayfaB extends StatefulWidget {
  const SayfaB({Key? key}) : super(key: key);

  @override
  _SayfaBState createState() => _SayfaBState();
}

class _SayfaBState extends State<SayfaB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa B"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("Geldiği Sayfaya Dön."),
                onPressed:(){
                  Navigator.pop(context);//Geldiği sayfaya geri döner.
                }

            ),
            RaisedButton(
                child: Text("Ana Sayfaya Dön."),
                onPressed:(){
                  Navigator.of(context).popUntil((route) => route.isFirst);//Ana sayfaya döner.(Geçiş yapmaz yani döndüğümüzde Appbarda geri gitme iconu olmaz)
                }

            ),
            RaisedButton(
                child: Text("Ana Sayfaya geçiş Yap."),
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AnaSayfa()));
                }

            ),
          ],
        ),
      ),

    );
  }
}
