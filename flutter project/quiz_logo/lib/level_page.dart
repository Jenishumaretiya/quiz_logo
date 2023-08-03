import 'package:flutter/material.dart';
import 'package:quiz_logo/level_logo.dart';

class level extends StatefulWidget {
  const level({Key? key}) : super(key: key);

  @override
  State<level> createState() => _levelState();
}

class _levelState extends State<level> {
  List l = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
  ];
  List img = [
    "flaga_at.png",
    "flaga_au.png",
    "flaga_be.png",
    "flaga_br.png",
    "flaga_ca.png",
    "flaga_cz.png",
    "flaga_de.png",
    "flaga_es.png",
    "flaga_fr.png",
    "flaga_nl.png",
    "flaga_pt.png",
    "flaga_ru.png",
    "flaga_fr.png",
    "flaga_de.png",
    "flaga_br.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Choose level"),
    ),
        body: ListView.builder(
      itemCount: l.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return second();
                },
              ));
            },
            child: Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              height: 100,
              width: double.infinity,
              color: Colors.grey,
              child: ListTile(
                leading: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("image/${img[index]}")),
                title: Text("${l[index]}"),
              ),
            ));
      },
    ));
  }
}
