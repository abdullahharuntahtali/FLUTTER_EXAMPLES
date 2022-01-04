import 'package:flutter/material.dart';

class Sayfa1 extends StatefulWidget {
  const Sayfa1({Key? key}) : super(key: key);

  @override
  _Sayfa1State createState() => _Sayfa1State();
}

class _Sayfa1State extends State<Sayfa1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Sayfa BİR",style: TextStyle(color: Colors.black54,fontSize: 30),),
    );
  }
}
