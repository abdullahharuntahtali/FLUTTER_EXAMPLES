import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/Yemekler.dart';

class DetaySayfa extends StatefulWidget {
   Yemekler yemek;


   DetaySayfa({required this.yemek});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.yemek.yemek_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "resimler/${widget.yemek.yemek_resim_adi}",
            ),

            Text("${widget.yemek.yemek_fiyati} \u{20BA}",style: TextStyle(fontSize: 50,color: Colors.blue),),

            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("Sipariş Ver"),
                onPressed: (){
                  print("Sipariş verildi");
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
