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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Elevated Button",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                shadowColor: Colors.black,
                elevation: 20, //Gölgenin Derinliği
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(15)),
                  side: BorderSide(color: Colors.green),
                ),
              ),
              onPressed: (){
                print("Elevated Butona Tıklandı");
              },
            ),
            TextButton(
              child: Text("Text Button",style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                shadowColor: Colors.black,
                elevation: 10, //Gölgenin Derin
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(15)),
                  side: BorderSide(color: Colors.pink),
                ),
              ),
              onPressed: (){
                print("Text Butona Tıklandı");
              },
            )
          ],
        ),
      ),

    );
  }
}
