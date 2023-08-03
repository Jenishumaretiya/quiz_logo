import 'package:flutter/material.dart';
import 'package:quiz_logo/level_4.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List l = [
    "int_a_bitcoin_a.png",
    "int_a_gmail_o.png",
    "int_a_google_b.png",
    "int_a_google_play_o.png",
    "int_a_tiktok_b.png",
    "int_a_tinder_b.png",
    "int_a_uber_a.png",
    "int_b_google_drive_o.png",
    "int_a_whatsapp_o.png",
    "l_a_amazon.png",
    "l_a_apple_s.png",
    "l_a_audi.png",
    "l_a_mercedes.png",
    "l_a_rolex_o.png",
    "l_a_starbucks_s.png",
    "l_a_volkswagen_s.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("level"),
      ),
      body: GridView.builder(
        itemCount: 15,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return three();
                },
              ));
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("image/${l[index]}"))),
            ),
          );
        },
      ),
    );
  }
}
