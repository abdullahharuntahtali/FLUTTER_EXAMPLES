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
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'İlham Ver'),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ekranYuksekligi/50,bottom: ekranYuksekligi/50),
            child: SizedBox(
              width: ekranGenisligi/4,
              child: Image.asset("resimler/stevejobs.png"),
            ),
          ),
          Text("Steve Jobs",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: ekranGenisligi/35,
            ),
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.only(left: ekranGenisligi/100, right: ekranGenisligi/100),
            child: Text("DÜNYAYI EĞİŞTİRECEK İNSANLAR, ONU DEĞİŞTİREBİLECEK KADAR ÇILGIN OLANLARDIR.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ekranGenisligi/25
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: ekranYuksekligi/100),
            child: SizedBox(
              width: ekranGenisligi/2,
              height: ekranGenisligi/15,
              child: RaisedButton(
                child: Text("İLHAM VER",style: TextStyle(fontSize: ekranGenisligi/25),),
                onPressed: (){
                  print("İlham verildi.");
                },
                color: Colors.redAccent,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
