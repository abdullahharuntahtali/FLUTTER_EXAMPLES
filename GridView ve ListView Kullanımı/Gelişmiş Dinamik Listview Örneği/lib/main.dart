import 'package:dinamik_listview/DetaySayfa.dart';
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
        primarySwatch: Colors.blue,
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

  var ulkeler=["Türkiye","Almanya","İtalya","Rusya","Fransa","Çin"]; //6 eleman var

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dinamik Liste Tasarımı")),
      ),
      body:ListView.builder(
        itemCount: ulkeler.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              //print("${ulkeler[index]} seçildi.");
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(ulkeAdi:  ulkeler[index])));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          print("Text ile ${ulkeler[index]} seçildi.");
                        },
                        child: Text(ulkeler[index])
                      ),
                      Spacer(),
                      //Flat Butonu da örnek olsun diye koydum. Denemk için yorum satırını kaldırırsanız PopupMenuyu Yoruma Alın.
                      /*FlatButton(
                        child: Text("Ülke Seç"),
                        textColor: Colors.white,
                        color: Colors.amber,
                        onPressed: (){
                          print("Buton ile ${ulkeler[index]} seçildi.");
                        },
                      ),*/
                      PopupMenuButton(
                        child: Icon(Icons.more_vert),
                        color: Colors.deepPurpleAccent,
                        itemBuilder: (context)=> [
                          PopupMenuItem(
                            value: 1,
                            child: Text("Sil",style: TextStyle(color: Colors.white),),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text("Güncelle",style: TextStyle(color: Colors.white),),
                          ),
                        ],
                        onSelected: (menuItemValue){
                          if(menuItemValue==1){
                            print("${ulkeler[index]} silindi.");
                          }
                          if(menuItemValue==2){
                            print("${ulkeler[index]} güncellendi..");
                          }
                        },

                      ),
  
                    ],
                  ),
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
