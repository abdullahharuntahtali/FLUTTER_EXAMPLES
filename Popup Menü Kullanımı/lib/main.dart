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
            PopupMenuButton(
                child: Icon(Icons.open_in_new),
                itemBuilder : (context)=> [
                  PopupMenuItem(
                    value: 1,
                      child: Text("Sil", style: TextStyle(color: Colors.red),),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Güncelle", style: TextStyle(color: Colors.indigoAccent),),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text("Ekle", style: TextStyle(color: Colors.brown),),
                  ),
                ],
              onCanceled: (){
                print("Seçim yapılmadı !!!");
              },
              onSelected: (menuItemValue){
                if(menuItemValue==1){
                  print("Sil Seçildi");
                }
                if(menuItemValue==2){
                  print("Güncelle Seçildi");
                }
                if(menuItemValue==3){
                  print("Ekle Seçildi");
                }
              },
            ),
          ],
        ),
      ),

    );
  }
}
