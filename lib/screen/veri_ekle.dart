import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mysql_avdisx/utils/database_helper.dart';

/* Code by avdisx */
class VERIEKLE extends StatefulWidget {
  @override
  _VERIEKLEState createState() => _VERIEKLEState();
}

class _VERIEKLEState extends State<VERIEKLE> {
  DATABASEISLEMLERI _database = new DATABASEISLEMLERI();
  String isim, soyisim, telefon;
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Veri Ekle || avdisx"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                maxLength: 30,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "İsim || Name",
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                validator: (value) {
                  if (value.length < 3) {
                    return "En az 3 harf";
                  }
                },
                onSaved: (deger) => isim = deger.toUpperCase(),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLength: 30,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Soyisim || Surname",
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                validator: (value) {
                  if (value.length < 3) {
                    return "En az 3 harf";
                  }
                },
                onSaved: (deger) => soyisim = deger.toUpperCase(),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLength: 30,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Telefon || Phone Number",
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                validator: (value) {
                  if (value.length < 3) {
                    return "En az 3 harf";
                  }
                },
                onSaved: (deger) => telefon = deger.toUpperCase(),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  bool sonuc;
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

                    sonuc = await _database.veriEkle(
                        isim: isim, soyisim: soyisim, telefon: telefon);
                    print(sonuc);
                    if (sonuc) {
                      Navigator.pop(context, true);
                    } else {
                      snackbarGoster(
                        "Kayıt Eklemede Hata Oluştu. İnternet Bağlantınızı Kontrol Ediniz.",
                      );
                    }
                  }

                  print("isim: $isim , soyisim: $soyisim , telefon: $telefon");
                },
                child: Text("Ekle"),
              ),
              SizedBox(
                height: 40,
              ),
              Text("GitHub: avdisx\nMedium: avdisx\nCreated By: avdisx"),
            ],
          ),
        ),
      ),
    );
  }

  void snackbarGoster(String mesaj) {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      margin: EdgeInsets.all(8),
      borderRadius: 15,
      backgroundGradient: LinearGradient(
        colors: [Colors.lightBlueAccent, Colors.green],
      ),
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
          color: Colors.blue[800],
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
      message: mesaj,
      icon: Icon(
        Icons.done_all,
        size: 28.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
