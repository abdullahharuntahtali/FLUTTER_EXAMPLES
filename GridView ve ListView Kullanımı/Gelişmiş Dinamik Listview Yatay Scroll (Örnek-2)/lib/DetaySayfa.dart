import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {

  String ulkeAdi;


  DetaySayfa({required this.ulkeAdi});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Detay Sayfası")),
      ),
      body:Center(
        child: Text(widget.ulkeAdi,style: TextStyle(fontSize: 30),),
      ),

    );
  }
}
