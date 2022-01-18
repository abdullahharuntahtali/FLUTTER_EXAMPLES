import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notlar_uygulamasi/NotDetaySayfa.dart';
import 'package:notlar_uygulamasi/NotKayitSayfa.dart';
import 'package:notlar_uygulamasi/Notlar.dart';
import 'package:notlar_uygulamasi/Notlardao.dart';

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
  Future<List<Notlar>> tumNotlariGoster() async {
    var notlarListesi = await Notlardao().tumNotlar();
    return notlarListesi;
  }
  Future<bool> uygulamayiKapat() async {
    await exit(0);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            uygulamayiKapat();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Notlar Uygulaması",style: TextStyle(color: Colors.white,fontSize: 18),),
            FutureBuilder<List<Notlar>>(
              future: tumNotlariGoster(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  var notlarListesi = snapshot.data;
                  double ortalama = 0.0 ;
                  if(!notlarListesi!.isEmpty){
                    double toplam = 0.0 ;
                    for(var n in notlarListesi){
                      toplam+=(n.not1+n.not2)/2;
                    }
                    ortalama = toplam / notlarListesi.length;
                  }
                  return Text("Ortalama : $ortalama",style: TextStyle(color: Colors.white,fontSize: 15),);

                }else{
                  return Text("Ortalama : 0",style: TextStyle(color: Colors.white,fontSize: 15),);
                }
              },
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: uygulamayiKapat,
        child: FutureBuilder<List<Notlar>>(
          future: tumNotlariGoster(),
          builder: (context,snapshot){
            if(snapshot.hasData){

              var notlarListesi = snapshot.data;
              return ListView.builder(
                itemCount: notlarListesi!.length,
                itemBuilder: (context,index){
                  var not = notlarListesi[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotDetaySayfa(not: not,)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(not.ders_adi,style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(not.not1.toString(),),
                            Text(not.not2.toString(),),
                          ],
                        ),
                      ),
                    ),
                  );

                },
              );

            }else{
              return Center();
            }
          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotKayitSayfa()));
        },
        tooltip: "Not Ekle",
        child: Icon(Icons.add),
      ),

    );
  }
}
