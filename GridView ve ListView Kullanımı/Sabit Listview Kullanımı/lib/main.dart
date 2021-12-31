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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text("Güneş"),
            subtitle: Text("Güneş alt başlık"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print("Güneşe tıklandı");
            },
          ),
          ListTile(
            leading: Icon(Icons.brightness_2),
            title: Text("Ay"),
            subtitle: Text("Ay alt başlık"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print("Aya tıklandı");
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Yıldız"),
            subtitle: Text("Yıldız alt başlık"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print("Yıldıza tıklandı");
            },
          ),
          GestureDetector(
            onTap: (){
              print("Kart tıklandı");
            },
            child: Card(
              child: SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Text("Card Tasarım"),
                    Spacer(),
                    Icon(Icons.more_vert),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print("Container tıklandı");
            },
            child: Container(
              height: 50,
              color: Colors.red,
              child: Text("Merhaba"),
            ),
          ),
        ],
      ),

    );
  }
}
