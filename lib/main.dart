import 'package:flutter/material.dart';
import 'package:shared_pref/pages/home_page.dart';
import 'package:shared_pref/pages/login_page.dart';
import 'package:shared_pref/services/pref.dart';

void main(List<String> args) {
runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
 bool? isLogin;

login()async{
  SharedPref.getLogin().then((value) {
    isLogin = value;
  });
  print("sss ${isLogin =await SharedPref.getLogin()}}");
}

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login();
    print("ishladii $isLogin");
  }
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      home: isLogin==null? const LoginPage():const HomePage(),
    );
  }
}