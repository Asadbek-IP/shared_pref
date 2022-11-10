import 'package:flutter/material.dart';
import 'package:shared_pref/model/user_model.dart';
import 'package:shared_pref/services/pref.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? email = "";
  showName(UserModel user){
    setState(() {
      email = user.email;
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
            },
            child: const Text("save pref"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async{
             SharedPref.getPref().then((value) =>showName(value) );
             SharedPref.getLogin().then((value) =>print(value));

            
            },
            child: const Text("get pref"),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(email!),
        ],
      )),
    );
  }
}
