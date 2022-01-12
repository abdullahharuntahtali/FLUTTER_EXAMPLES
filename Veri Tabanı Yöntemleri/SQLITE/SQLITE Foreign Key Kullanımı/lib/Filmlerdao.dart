import 'package:sqlite_foreign_kullanimi/Filmler.dart';
import 'package:sqlite_foreign_kullanimi/Kategoriler.dart';
import 'package:sqlite_foreign_kullanimi/VeritabaniYardimcisi.dart';
import 'package:sqlite_foreign_kullanimi/Yonetmenler.dart';

class Filmlerdao {

  //select * from filmler,kategoriler,yonetmenler where filmler.kategori_id=kategoriler.kategori_id and filmler.yonetmen_id=yonetmenler.yonetmen_id


  Future<List<Filmler>> tumFilmler() async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("select * from filmler,kategoriler,yonetmenler"
        " where filmler.kategori_id=kategoriler.kategori_id and filmler.yonetmen_id=yonetmenler.yonetmen_id");

    return List.generate(maps.length, (i){

      var satir = maps[i];

      var kategori = Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var yonetmen = Yonetmenler(satir["yonetmen_id"], satir["yonetmen_ad"]);
      var film = Filmler(satir["film_id"],satir["film_ad"],satir["film_yil"],satir["film_resim"],kategori,yonetmen);
      
      return film;

    });


  }


}