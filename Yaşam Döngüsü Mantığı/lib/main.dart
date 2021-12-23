import 'package:flutter/material.dart';

import 'SayfaA.dart';

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

class _AnaSayfaState extends State<AnaSayfa> with WidgetsBindingObserver {

  @override
  void initState() {  //Başlatma

    super.initState();
    print("initState() Metodu Çalıştı");

     WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() { //Bitirme

    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    if(state==AppLifecycleState.inactive){
      print("inactive() çalıştı");

    }
    if(state==AppLifecycleState.paused){
      print("paused() çalıştı");

    }
    if(state==AppLifecycleState.resumed){
      print("resumed() çalıştı");

    }
    if(state==AppLifecycleState.detached){
      print("detached() çalıştı");

    }

  }



  @override
  Widget build(BuildContext context) {

    print("build() Metodu Çalıştı"); //*Bu metodu setState() metoduda tetikler.

    return Scaffold(
      appBar: AppBar(
        title: Text("Yaşam Döngüsü"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text("TIKLA"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SayfaA()));
                }),
          ],
        ),
      ),

    );
  }
}
