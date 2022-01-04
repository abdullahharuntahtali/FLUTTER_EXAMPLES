import 'package:film_uygulamasi/Filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {

  Filmler film;


  DetaySayfa(this.film);

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("${widget.film.film_adi}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim_adi}"),
            Text("${widget.film.film_fiyat} \u{20BA}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.blue),),
            SizedBox(
              width: 300,
              height: 100,
              child: RaisedButton(
                child: Text("KİRALA",style: TextStyle(fontSize: 40),),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: (){

                  print("${widget.film.film_adi} adlı film kiralandı");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
