import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_login_uygulamasi/AnaSayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  Future<bool> oturumKontrol() async{
    var sp = await SharedPreferences.getInstance();

    String spKullaniciAdi = sp.getString("kullaniciAdi") ?? "Kullanıcı Adı Yok";
    String spSifre = sp.getString("sifre") ?? "Şifre Yok";

    if(spKullaniciAdi=="admin" && spSifre=="123"){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: oturumKontrol(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            bool geciIzni=snapshot.data!;
            return geciIzni ? AnaSayfa() : LoginEkrani();
          }else{
            return Container();
          }

        },
      ),
    );
  }
}

class LoginEkrani extends StatefulWidget {

  @override
  State<LoginEkrani> createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {

  var tfKullaniciAdi = TextEditingController();
  var tfKullaniciSifre = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();


  Future<void> girisKontrol() async{

    var ka = tfKullaniciAdi.text;
    var s = tfKullaniciSifre.text;

    if(ka == "admin" && s == "123"){
      var sp = await SharedPreferences.getInstance();

      sp.setString("kullaniciAdi", ka);
      sp.setString("sifre", s);

      print("Doğru");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AnaSayfa()));

    }else{
      scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("Giriş Hatalı"),));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Login Ekranı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: tfKullaniciAdi,
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adı"
                ),
              ),
              TextField(
                obscureText: true,
                controller: tfKullaniciSifre,
                decoration: InputDecoration(
                    hintText: "Şifre",
                ),
              ),
              RaisedButton(
                child: Text("Giriş Yap"),
                onPressed: (){
                  girisKontrol();



                },
              ),
            ],
          ),
        ),


      ),

    );
  }
}
