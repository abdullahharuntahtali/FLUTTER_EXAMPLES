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

  var ulkeler= ["Türkiye","İtalya","Rusya","Almanya","Çin","İran"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Bir satırda kaç eleman olsun
          childAspectRatio: 2 / 1, //2 genişlik 1 yükseklik

        ),
        itemCount: ulkeler.length,
        itemBuilder: (context,index){
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ulkeler[index]),
              ],
            ),
          );
        },
      ),

    );
  }
}
