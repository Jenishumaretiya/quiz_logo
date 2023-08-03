import 'package:flutter/material.dart';
import 'package:quiz_logo/level_page.dart';


void main() {
  runApp(MaterialApp(
    home: first(),
    debugShowCheckedModeBanner: false,
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  bool temp_border = false;
  bool temp_border6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            AssetImage("image/main_background_top_logos.png"),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  LOGO GAME",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "  Quiz your brands knowledge",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: GestureDetector(
                    onTapUp: (details) {
                      temp_border = false;
                      setState(() {});
                    },
                    onTapDown: (details) {
                      temp_border = true;
                      setState(() {});
                    },
                    onTapCancel: () {
                      temp_border = false;
                      setState(() {});
                    },
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return level();
                      },));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 200,
                      width: double.infinity,
                      child: Expanded(
                          child: Baseline(
                            child: Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 250),
                                width: 90,
                                height: 90,
                                child: Text("hhh",
                                  style:
                                  TextStyle(color: Colors.black,fontSize: 20)),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(50),
                                 color: Colors.red
                               ),
                              ),
                            ),
                              baseline: 40,
                              baselineType: TextBaseline.alphabetic)),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/main_button_play.png"),
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 190,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 100),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("image/main_button_ranking.png"),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 100),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("image/main_button_stats.png"),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 100),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "image/main_button_achievements.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("image/CLt.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
