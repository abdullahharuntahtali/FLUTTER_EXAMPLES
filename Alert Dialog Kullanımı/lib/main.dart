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


  var tfControl=TextEditingController();

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
            ElevatedButton(
              child: Text("Basit Alert"),
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Başlık"),
                        content: Text("İçerik"),
                        actions: [
                          FlatButton(
                            child: Text("İptal"),
                              onPressed: (){
                              Navigator.pop(context);

                              },
                          ),
                          FlatButton(
                            child: Text("Tamam"),
                            onPressed: (){
                              print("Tamam seçildi");

                            },
                          ),
                        ],
                      );
                    }
                );

              },
            ),
            ElevatedButton(
              child: Text("Özel Alert"),
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Özel Alert",style: TextStyle(color: Colors.white,fontSize: 25),),
                        backgroundColor: Colors.indigoAccent,
                        content: SizedBox(
                          height: 80,
                          child: Column(
                            children: [
                              TextField(
                                controller: tfControl,
                                decoration: InputDecoration(
                                  labelText: "Veri",
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          FlatButton(
                            child: Text("İptal",style: TextStyle(color: Colors.white)),
                            onPressed: (){
                              Navigator.pop(context);

                            },
                          ),
                          FlatButton(
                            child: Text("Veri Oku",style: TextStyle(color: Colors.white)),
                            onPressed: (){
                              String alinanVeri=tfControl.text;
                              print("Veri okundu : $alinanVeri");
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}
