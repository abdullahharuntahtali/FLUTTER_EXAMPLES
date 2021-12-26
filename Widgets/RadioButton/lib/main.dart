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

  int radioDeger=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile(
                title: Text("Galatasaray"),
                value: 1,
                groupValue: radioDeger,
                activeColor: Colors.pink,
                onChanged: (int? veri){
                  setState(() {
                    radioDeger=veri ?? 1;
                  });
                  print("Galatasaray");
                }
            ),
            RadioListTile(
                title: Text("Fenerbahçe"),
                value: 2,
                groupValue: radioDeger,
                activeColor: Colors.deepPurple,
                onChanged: (int? veri){
                  setState(() {
                    radioDeger=veri ?? 2;
                  });
                  print("Fenerbahçe");
                }
            ),
            RaisedButton(
                child: Text("GÖSTER"),
                onPressed: (){
                  if(radioDeger==1)
                    print("Buton : Galatasaray seçildi");

                  else
                    print("Buton : Fenerbahçe seçildi");
                }

            ),
          ],
        ),
      ),

    );
  }
}
