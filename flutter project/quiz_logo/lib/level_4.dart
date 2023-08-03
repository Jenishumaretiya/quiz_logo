import 'package:flutter/material.dart';

class three extends StatefulWidget {
  const three({Key? key}) : super(key: key);

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  List ans =["one","two","three","four","five"];
  List option =[];
  List pos = [];
  List userans = [];
  List r = ["j","f","h","d","p","s","w","r","b","n","m","h","t","a"];
  int cur_level = 0;


  @override
  void initState() {
   r.shuffle();
   option = List.filled(14, "");
   pos = List.filled(14, "");
   userans = List.filled(ans[cur_level].toString().length, "");

   for (int i = 0; i< ans[cur_level].toString().length; i++)
   {
     option[i] = ans[cur_level].toString()[i];
   }

   for (int i = ans[cur_level].toString().length; i < 14; i++)
     {
       option[i] = r[i];
     }
   option.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("logo"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
                child:Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                  child: Icon(Icons.person,
                  size: 100,),
                )),
            Expanded(
                child:Wrap(
                  children: List.generate(ans[cur_level].toString().length,
                          (index) => InkWell(
                            onTap: () {
                              option[pos[index]]=userans[index];
                              userans[index]="";
                              setState(() {

                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              color: Colors.blue,
                              child: Text("${userans[index]}"),
                            ),
                          )),
                )
            ),

            Expanded(
              flex: 2,
                child: GridView.builder(
                  itemCount: 14,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return (option[index] != "")
                         ? InkWell(onTap: () {
                           for (int i =0; i< userans.length;i++)
                             if(userans[i] == ""){
                               userans[i] = option[index];
                               option[index]="";
                               pos[i]=index;
                               setState(() {

                               });
                             }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            color: Colors.grey,
                            child: Text("${option[index]}"),
                          ),
                          ):Text("");
                    },

                )),
          ],
        ));
  }
}
