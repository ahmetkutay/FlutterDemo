import 'package:flutter/material.dart';

import 'models/student.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Students Exam System";

  String seciliOgrenci = " ";

  List<Student> students = [
    new Student("Ahmet", "Karacair", 95,
        "https://cdn.pixabay.com/photo/2020/03/12/07/55/city-4924252_960_720.jpg"),
    new Student("Halil", "Duymaz", 55,
        "https://cdn.pixabay.com/photo/2020/03/15/10/48/people-4933219_960_720.jpg")
  ];

  var ogrenciler = ["Student Group 1:", "Orhun", "Metin", "Ahmet", "Kutay"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String sinavSonucu) {
    var alert = AlertDialog(
      title: Text("Exam Result "),
      content: Text(sinavSonucu),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(students[index].personImage),
                  ),
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Sınavdan aldığı not : " +
                      students[index].grade.toString() +
                      " [" +
                      students[index].getStatus +
                      "]"),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      seciliOgrenci = students[index].firstName +
                          " " +
                          students[index].lastName;
                    });
                  },
                );
              }),
        ),
        Text("Seçili Öğrenci : " + seciliOgrenci),
        Center(
          child: RaisedButton(
            child: Text("Result"),
            onPressed: () {
              mesajGoster(context, mesaj);
            },
          ),
        ),
      ],
    );
  }

  buildStatusIcon(int grade) {
    if (grade < 60) {
      return Icon(Icons.clear);
    } else {
      return Icon(Icons.done);
    }
  }
}
