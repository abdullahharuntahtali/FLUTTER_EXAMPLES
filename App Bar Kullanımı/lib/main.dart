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
        primarySwatch: Colors.deepOrange,
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
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [

            Text("Başlık",style: TextStyle(color: Colors.white,fontSize: 16.0)),
            Text("Alt Başlık",style: TextStyle(color: Colors.white,fontSize: 12.0)),

          ],
        ),
        centerTitle: false,
        leading: IconButton(
          tooltip: "Menu Icon",
          icon: Icon(Icons.dehaze),
          onPressed: (){
            print("Menü Icon tıklandı");
          },
        ),
        actions: [ //Birden fazla tanım yapılabilir

          FlatButton(
            child: Text("ÇIKIŞ",style: TextStyle(color: Colors.white),),
            onPressed: (){
              print("Çıkış Tıklandı");
            },

          ),
          IconButton(
            tooltip: "Bilgi",
            icon: Icon(Icons.info_outline),
            onPressed: (){
              print("Bilgi tıklandı");
            },
          ),
         PopupMenuButton(
           child: Icon(Icons.more_vert),
           itemBuilder: (context) => [
             PopupMenuItem(
               value: 1,
               child: Text("Sil"),
             ),
             PopupMenuItem(
               value: 2,
               child: Text("Güncelle"),
             ),
           ],
            onSelected: (value){
             if(value==1){
               print("Sil tıklandı.");
             }
             if(value==2){
               print("Güncelle tıklandı.");
             }
            },
         ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}
