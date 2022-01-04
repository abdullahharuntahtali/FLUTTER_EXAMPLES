import 'package:flutter/material.dart';

class Sayfa3 extends StatefulWidget {
  const Sayfa3({Key? key}) : super(key: key);

  @override
  _Sayfa3State createState() => _Sayfa3State();
}

class _Sayfa3State extends State<Sayfa3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Sayfa ÜÇ",style: TextStyle(color: Colors.black54,fontSize: 30),),
    );
  }
}
