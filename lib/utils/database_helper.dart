import 'package:flutter/cupertino.dart';
import 'package:flutter_mysql_avdisx/model/sozluk_model.dart';
import 'package:mysql1/mysql1.dart';

/* Code by avdisx */

class DATABASEISLEMLERI {
  final String _host = 'hostname';
  final int _port = 3306;
  final String _user = "username";
  final String _password = "password";
  final String _db = "veritabanıAdi";

  DATABASEISLEMLERI();

  Future<List<SozlukGirisModel>> verileriGetir() async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );

      List<SozlukGirisModel> listem = [];
      var verilerinListesi =
          await baglan.query('select *from tabloAdi order by id DESC');
      //print(verilerinListesi.toList());
      for (var item in verilerinListesi) {
        listem.add(
          SozlukGirisModel(
            item["id"],
            item["isim"],
            item["soyisim"],
            item["telefon"],
          ),
        );
      }
      await baglan.close();
      return listem;
    } catch (e) {
      return null;
    }
  }

  Future<bool> veriEkle(
      {@required String isim, String soyisim, String telefon}) async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );
      // ekleme kodları sonra eklerse true döndür

      await baglan.query(
          "insert into tabloAdi (isim,soyisim,telefon) values (?,?,?)",
          [isim, soyisim, telefon]);
      await baglan.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> veriGuncelle(
      {@required int id, String isim, String soyisim, String telefon}) async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );
      // güncelledikte  sonra  true döndür

      await baglan.query(
          "update tabloAdi set isim=? , soyisim=? , telefon = ? where id = ?",
          [isim, soyisim, telefon, id]);
      await baglan.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> veriSil({@required int id}) async {
    try {
      final baglan = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );
      // sildikten sonra  true döndür

      await baglan.query('delete from tabloAdi where id=?', [id]);
      await baglan.close();
      return true;
    } catch (e) {
      return false;
    }
  }
}
