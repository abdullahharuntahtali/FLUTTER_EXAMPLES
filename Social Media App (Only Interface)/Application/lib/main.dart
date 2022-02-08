import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gonderikarti.dart';
import 'profilsayfasi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
            size: 32.0,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Sociaworld",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.purple.shade300,
              size: 32.0,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return Column(
                    children: [
                      duyuru("Kamil seni takip etti.","3 dk. önce"),
                      duyuru("Neriman gönderine yorum yaptı.","8 gün önce"),
                      duyuru("Cüneyt sana mesaj gönderdi.","2 hafta önce"),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 110.0,
            //width: double.infinity, //Kulnmasakta olur. Çünkü Align belirtmediğimizden rowun tamamını kapsar
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: ListView(
              scrollDirection: Axis.horizontal, //Yana kAYDIRABİLMEK için
              children: [
                profilKartiOlustur(
                  "Selçuk",
                  "https://cdn.pixabay.com/photo/2019/06/04/20/00/man-4252192_960_720.jpg",
                  "Selçuk DİNÇER",
                  "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_960_720.jpg",
                ),
                profilKartiOlustur(
                  "Akın",
                  "https://cdn.pixabay.com/photo/2021/07/15/08/04/man-6467779_960_720.jpg",
                  "Akın YILDIZ",
                  "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_960_720.jpg",
                ),
                profilKartiOlustur(
                  "Ayşe",
                  "https://cdn.pixabay.com/photo/2017/04/05/10/45/girl-2204622_960_720.jpg",
                  "Ayşe EREN",
                  "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_960_720.jpg",
                ),
                profilKartiOlustur(
                  "Belma",
                  "https://cdn.pixabay.com/photo/2014/09/17/20/03/profile-449912_960_720.jpg",
                  "Belma KARASU",
                  "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_960_720.jpg",
                ),
                profilKartiOlustur(
                  "Yıldız",
                  "https://cdn.pixabay.com/photo/2017/04/06/19/34/girl-2209147_960_720.jpg",
                  "Yıldız AK",
                  "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_960_720.jpg",
                ),
                profilKartiOlustur(
                    "Nadir",
                    "https://cdn.pixabay.com/photo/2021/06/04/10/29/man-6309454_960_720.jpg",
                    "Nadir AKAY",
                    "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_960_720.jpg"),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GonderiKarti(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869_960_720.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2022/01/26/20/43/baboon-6969935_960_720.jpg",
            isimSoyad: "Hakan YILDIZ",
            gecenSure: "1 sene önce",
            aciklama: "Açıklama",
          ),
          GonderiKarti(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2014/09/17/20/03/profile-449912_960_720.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2015/03/14/19/45/suit-673697_960_720.jpg",
            isimSoyad: "Belma KARASU",
            gecenSure: "2 ay önce",
            aciklama: "Açıklama...",
          ),
          GonderiKarti(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2021/06/04/10/29/man-6309454_960_720.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2017/06/22/12/19/tiger-2430625_960_720.jpg",
            isimSoyad: "Nadir AKAY",
            gecenSure: "1 hafta önce",
            aciklama: "Açıklamaaa...",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.purple.shade300,
        child: Icon(Icons.add_a_photo,color: Colors.white,),
      ),
    );
  }

  Padding duyuru(String mesaj, String gecenSure) {
    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(mesaj,style: TextStyle(fontSize: 15.0,),),
                          Text(gecenSure),
                        ],
                      ),
                    );
  }

  Widget profilKartiOlustur(String kullaniciAdi, String resimLinki,
      String isimSoyad, String kapakResimLinki) {
    return Material(
      child: InkWell(
        onTap: () async {
          bool donenVeri = await Navigator.of(context).push(CupertinoPageRoute(
              builder: (BuildContext context) => ProfilSayfasi(
                    profilResimLinki: resimLinki,
                    kullaniciAdi: kullaniciAdi,
                    isimSoyad: isimSoyad,
                    kapakResimLinki: kapakResimLinki,
                  )));
          if(donenVeri){
            print("Kullanıcı Profil Sayfasından Döndü");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(35.0),
                        image: DecorationImage(
                          image: NetworkImage(resimLinki),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(width: 2.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                kullaniciAdi,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
