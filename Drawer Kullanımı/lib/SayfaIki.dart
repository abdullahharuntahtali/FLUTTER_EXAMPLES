import 'package:flutter/material.dart';

class SayfaIki extends StatefulWidget {
  const SayfaIki({Key? key}) : super(key: key);

  @override
  _SayfaIkiState createState() => _SayfaIkiState();
}

class _SayfaIkiState extends State<SayfaIki> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Sayfa İKİ",style: TextStyle(color: Colors.black54,fontSize: 40),),
    );
  }
}
