import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var tfGirdi = TextEditingController();

  Future<void > veriYaz() async{

    var ad = await getApplicationDocumentsDirectory();

    var uygulamaDosyalamaYolu = await ad.path;

    print(ad.path.toString());
    var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

    dosya.writeAsString(tfGirdi.text);

    tfGirdi.text = "";

  }

  Future<void> veriOku() async{

    try{
      var ad = await getApplicationDocumentsDirectory();

      var uygulamaDosyalamaYolu = await ad.path;

      var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

      String okunanVeri = await dosya.readAsString();

      tfGirdi.text=okunanVeri;
    }catch(e){
      e.toString();
    }
    

  }

  Future<void> veriSil() async{

    var ad = await getApplicationDocumentsDirectory();

    var uygulamaDosyalamaYolu = await ad.path;

    var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

    if(dosya.existsSync()){
      dosya.delete();
    }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: tfGirdi,
                decoration: InputDecoration(
                  hintText: "Veri Giriniz",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text("Yaz"),
                  onPressed: (){
                    veriYaz();
                  },
                ),
                RaisedButton(
                  child: Text("Oku"),
                  onPressed: (){
                    veriOku();
                  },
                ),
                RaisedButton(
                  child: Text("Sil"),
                  onPressed: (){
                    veriSil();
                  },
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
