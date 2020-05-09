import 'package:flutter/material.dart';
import 'package:flutter_mysql_avdisx/screen/veri_ekle.dart';
import 'package:flutter_mysql_avdisx/screen/veri_listesi.dart';

/* Code by avdisx */
class ANASAYFA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Mysql by avdisx"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VERILISTESI()));
              },
              icon: Icon(Icons.line_style),
              label: Text("Veri Listesi"),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VERIEKLE()));
              },
              icon: Icon(Icons.add),
              label: Text("Veri Ekle"),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
