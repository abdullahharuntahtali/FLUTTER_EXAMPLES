import 'package:film_uygulamasi/DetaySayfasi.dart';
import 'package:film_uygulamasi/Filmler.dart';
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
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  Future<List<Filmler>> filmleriGetir() async{

    var filmlerListesi=<Filmler>[];

    var f1=Filmler(1, "Anadoluda", "anadoluda.png", 15.89);
    var f2=Filmler(1, "Django", "django.png", 9.99);
    var f3=Filmler(1, "Inception", "inception.png", 6.99);
    var f4=Filmler(1, "Interstellar", "interstellar.png", 21.99);
    var f5=Filmler(1, "The Hateful Eight", "thehatefuleight.png", 3.79);
    var f6=Filmler(1, "The Pianist", "thepianist.png", 18.69);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Film Uygulaması"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var filmlerListesi=snapshot.data;
            return GridView.builder(
              itemCount: filmlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5 , //Genişlik / Yükseklik
              ),
              itemBuilder: (context,index){
                var film = filmlerListesi[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film) ));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("resimler/${film.film_resim_adi}"),
                        ),
                        Text(film.film_adi,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${film.film_fiyat} \u{20BA}",style: TextStyle(fontSize: 16,),),
                      ],
                    ),
                  ),
                );
              },

            );

          }else{

            return Center();
          }


        },

      ),
    );
  }
}
