import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name="";

  void savePref(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", name);
  }
  

   Future<String>? getPref() async{
   SharedPreferences pref = await SharedPreferences.getInstance();
     return pref.getString("name")!;
   }

  showName(String name2){
    setState(() {
      name = name2;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              savePref("Husan");
            },
            child: const Text("save pref"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async{
               getPref()!.then((value) => showName(value));
            },
            child: const Text("get pref"),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(name!),
        ],
      )),
    );
  }
}
