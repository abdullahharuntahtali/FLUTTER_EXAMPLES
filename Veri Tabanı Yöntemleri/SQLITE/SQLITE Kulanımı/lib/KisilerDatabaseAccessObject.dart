import 'package:sqlite_kullanimi/Kisiler.dart';
import 'package:sqlite_kullanimi/VeritabaniYardimcisi.dart';

class Kisilerdao {

  Future<List<Kisiler>> tumKisiler() async{

    var db = await VeritabaniYardimcisi.veritabaniErisim(); // Bu sayede veritabanına erişiriz


    //dynamic = türü her cins olabilir.(int,string,bool ..)
    List<Map<String,dynamic>> maps = await db.rawQuery("select * from kisiler");

    return List.generate(maps.length, (i) {

      var satir = maps[i];


      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);

    });



  }

  Future<void> kisiEkle(String kisi_ad,int kisi_yas) async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String,dynamic>();

    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_yas"] = kisi_yas;

    await db.insert("kisiler", bilgiler);

  }


}