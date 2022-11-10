import 'package:flutter/material.dart';
import 'package:shared_pref/model/user_model.dart';
import 'package:shared_pref/services/pref.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController = TextEditingController();
    TextEditingController? passController = TextEditingController();
   
   _login(){
    String email = emailController!.text;
    String password = passController!.text;

    UserModel userModel = UserModel(email: email,password: password);
    SharedPref.savePref(userModel);
    SharedPref.saveLogin(true);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30)),
          child: TextField(
          controller: emailController!,
            decoration: const InputDecoration(
              hintText: "email",
              prefixIcon: Icon(Icons.email,size: 30,color: Colors.blue,),
              border: InputBorder.none),
          ),
        ),
        const SizedBox(height: 10,),
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30)),
          child:  TextField(
          controller: passController,
            decoration: const InputDecoration(
              hintText: "password",
              prefixIcon: Icon(Icons.lock,size: 30,color: Colors.blue,),
              border: InputBorder.none),
          ),
        ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
          _login();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
          }, child: const Text("Login")),
      ]),
    );
  }
}
