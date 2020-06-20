import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "First App";
  String sonuc;
  @override
  Widget build(BuildContext context) {
    var ogrenciler = [
      "Student Group 1:",
      "Orhun",
      "Metin",
      "Ahmet",
      "Kutay"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: ogrenciler.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(ogrenciler[index]);
                }),
          ),
          Center(
            child: RaisedButton(
              child: Text("Result"),
              onPressed: () {
                var mesaj =sinavHesapla(91);
                mesajGoster(context,mesaj);
              },
            ),
          ),
        ],
      ),
    );
  }

  String sinavHesapla(int not) {
    if (not < 90) {
      sonuc = "Fail";
    } else {
      sonuc = "Pass";
    }
    return sonuc;
  }

  void mesajGoster(BuildContext context,String sinavSonucu) {
    var alert = AlertDialog(
      title: Text("Group Exam Result "),
      content: Text(sinavSonucu),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
