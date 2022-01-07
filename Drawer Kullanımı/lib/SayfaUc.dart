import 'package:flutter/material.dart';

class SayfaUc extends StatefulWidget {
  const SayfaUc({Key? key}) : super(key: key);

  @override
  _SayfaUcState createState() => _SayfaUcState();
}

class _SayfaUcState extends State<SayfaUc> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Sayfa ÜÇ",style: TextStyle(color: Colors.black54,fontSize: 40),),
    );
  }
}
