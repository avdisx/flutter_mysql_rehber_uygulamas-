import 'package:flutter/material.dart';
import 'package:flutter_mysql_avdisx/screen/veri_listesi.dart';

/* Code by avdisx */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VERILISTESI(),
    );
  }
}
