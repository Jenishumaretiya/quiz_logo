import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
void main(){
  runApp(MaterialApp(
    home: data(),
  ));
}
class data extends StatefulWidget {
  const data({Key? key}) : super(key: key);

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text("User Integraction"),
          bottom:TabBar(
            tabs: [
              Tab(icon: Icon(Icons.security)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.group)),
            ],
          ),
        ),
        body: TabBarView(children: [
          one(),
          second(),
          therd(),
        ]),
      ),
    );
  }
}
class one extends StatefulWidget {
  const one({Key? key}) : super(key: key);

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      //backgroundColor: Colors.black,
    );
  }
}
class second extends StatefulWidget {
  static Database ?database;

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  TextEditingController t1 =TextEditingController();
  TextEditingController t2 =TextEditingController();
  TextEditingController t3 =TextEditingController();
  TextEditingController t4 =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_ins();
  }
  get_ins() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
// open the database
    second.database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE sumit (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,email TEXT,birth TEXT,password TEXT)'
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 320,
          //margin: EdgeInsets.fromLTRB(0,0, 0,200),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                controller: t1,
                decoration: InputDecoration(
                  hintText: "Enter Name :",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      gapPadding: 10
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: t2,
                decoration: InputDecoration(
                  hintText: "Enter Email :",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: t3,
                onTap: () {
                  showDatePicker(context: context,
                      initialDate:DateTime.now(),
                      firstDate: DateTime(1950), lastDate: DateTime(2025)).then((value) {
                    String dt=value.toString();
                    var month=DateFormat("MM").format(value!);
                    var day=DateFormat("d").format(value!);
                    var year=DateFormat("yyyy").format(value!);
                    String date=month+"/"+day+"/"+year;
                    t3.text=date;
                    setState(() {});
                  },
                  );
                },
                decoration: InputDecoration(
                  hintText: "Enter Date of birth ",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: t4,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {
                String name = t1.text;
                String email = t2.text;
                String birth = t3.text;
                String passowrd= t4.text;
                String sql="insert into sumit values(null,'$name','$email','$birth','$passowrd')";
                print(sql);
                second.database!.rawInsert(sql);
                t1.text="";
                t2.text="";
                t3.text="";
                t4.text="";
                setState(() {});
              },child:Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}
class therd extends StatefulWidget {
  const therd({Key? key}) : super(key: key);

  @override
  State<therd> createState() => _therdState();
}

class _therdState extends State<therd> {
  List<Map> l=[];
  List<Map> l1=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_view();

  }
  get_view() async {
    String sql="select * from sumit";
    l=await second.database!.rawQuery(sql);
    l1=l;
    print(l);
    setState(() {});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(2),
        itemCount: l.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.black45,
            child: ListTile(
              title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name:${l[index]['name']}"),
                  Text("Emial:${l[index]['email']}"),
                  Text("E mail Id:${l[index]['birth']}"),
                  Text("Password:${l[index]['password']}"),
                ],
              ),
              trailing: PopupMenuButton(itemBuilder: (context) => [
                PopupMenuItem(
                  child: InkWell(
                    onTap: () {

                    },child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 8),
                      Text("Edit",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  ),
                ),
                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      String sql="delete from table2 where id='${l[index]['id']}'";
                      second.database!.rawDelete(sql);
                      print(sql);
                      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                      //   return view();
                      // },)); String sql="delete from table2 where id='${l[index]['id']}'";
                      second.database!.rawDelete(sql);
                      print(sql);
                      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                      //   return view();
                      // },));
                      setState(() {});
                    },child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 8),
                      Text("Delete",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  ),
                ),
              ],),
            ),
          );
        },),


    );
  }
}