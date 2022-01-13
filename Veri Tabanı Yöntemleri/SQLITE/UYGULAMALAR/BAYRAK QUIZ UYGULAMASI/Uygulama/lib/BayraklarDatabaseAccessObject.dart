import 'package:bayrak_uygulamasi/Bayraklar.dart';
import 'package:bayrak_uygulamasi/VeritabaniYardimcisi.dart';

class BayraklarDAO {

  Future<List<Bayraklar>> rastgele5Getir() async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("select * from bayraklar order by random() limit 5 ");

    return List.generate(maps.length, (i){

      var satir = maps[i];
      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);

    });
  }

  Future<List<Bayraklar>> rastgele3YanlisGetir(int bayrak_id) async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("select * from bayraklar where bayrak_id !=$bayrak_id order by random() limit 3");

    return List.generate(maps.length, (i){

      var satir = maps[i];
      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);

    });
  }

}