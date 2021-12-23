import 'package:flutter/material.dart';

class SayfaA extends StatefulWidget {
  const SayfaA({Key? key}) : super(key: key);

  @override
  _SayfaAState createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {

  @override
  void deactivate() {

    super.deactivate();
    print("Sayfa A: deactivate() Metodu Çalıştı");

  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Sayfa A: dispose() Metodu Çalıştı");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SayfaA"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),

    );
  }
}
