
import 'dart:ui';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SingleChildScrollView( //Sütunumuza TextField var. Yazı yazarken klavye geldiğinde sütun ekrana sığmadığında kaydırılabilirlik özelliği sağlar.

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: ekranYuksekligi/20),
                child: SizedBox(
                    width: ekranGenisligi/4,
                    child: Image.asset("resimler/logo.png")
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi/30),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi/30),
                child: TextField(
                  obscureText: true, //TextField içinde bulunan metni gizler
                  decoration: InputDecoration(
                    hintText: "Şifre",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi/30),
                child: SizedBox(

                  width: ekranGenisligi/1.2,
                  height: ekranYuksekligi/12,

                  child:
                  RaisedButton(
                    child: Text("GİRİŞ YAP",
                      style: TextStyle(
                        fontSize: ekranGenisligi/25,
                      ),
                    ),
                    onPressed: (){
                    print("Giriş Yapıldı");
                  },
                    color: Colors.pink,
                    textColor: Colors.white,
                    
                  ),
                ),
              ),
              GestureDetector( //Textimize tıklanılabilirlik özelliği sağladı
                onTap: (){
                  print("Yardım seçildi...");
                },
                child: Text(
                  "Yardım ?",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: ekranGenisligi/30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
