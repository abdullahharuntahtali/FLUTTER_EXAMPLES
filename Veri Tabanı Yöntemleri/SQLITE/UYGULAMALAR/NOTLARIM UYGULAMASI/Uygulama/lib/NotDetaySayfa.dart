import 'package:flutter/material.dart';
import 'package:notlar_uygulamasi/Notlardao.dart';

import 'Notlar.dart';
import 'main.dart';

class NotDetaySayfa extends StatefulWidget {

  Notlar not;

  NotDetaySayfa({required this.not});

  @override
  _NotDetaySayfaState createState() => _NotDetaySayfaState();
}

class _NotDetaySayfaState extends State<NotDetaySayfa> {




  var tfDersAdi = TextEditingController();
  var tfNot1 = TextEditingController();
  var tfNot2 = TextEditingController();
  Future<void> sil(int not_id) async {

    await Notlardao().notSil(not_id);

    print("$not_id Silindi.");
    Navigator.push(context, MaterialPageRoute(builder: (context) => AnaSayfa()));

  }
  Future<void> guncelle(int not_id,String dersAdi,int not1,int not2) async {

    await Notlardao().notGuncelle(not_id, dersAdi, not1, not2);

    print("$dersAdi  -  $not1  - $not2 kayıt güncellendi");
    Navigator.push(context, MaterialPageRoute(builder: (context) => AnaSayfa()));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var not = widget.not;
    tfDersAdi.text=not.ders_adi;
    tfNot1.text=not.not1.toString();
    tfNot2.text=not.not2.toString();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Detay"),
        actions: [
          FlatButton(
            child: Text("Sil",style: TextStyle(color: Colors.white),),
            onPressed: (){
              sil(widget.not.not_id);
            },
          ),
          FlatButton(
            child: Text("Güncelle",style: TextStyle(color: Colors.white),),
            onPressed: (){
              guncelle(widget.not.not_id,tfDersAdi.text,int.parse(tfNot1.text),int.parse(tfNot2.text));
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: tfDersAdi,
                decoration: InputDecoration(hintText: "Ders Adı"),
              ),
              TextField(
                controller: tfNot1,
                decoration: InputDecoration(hintText: "1. Not"),
              ),
              TextField(
                controller: tfNot2,
                decoration: InputDecoration(hintText: "2. Not"),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
