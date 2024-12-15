import 'package:flutter/material.dart';
import 'package:mobile_computing_smart_home/Sign%20In/login_register_page.dart';
import 'package:mobile_computing_smart_home/screen/Home.dart';
// import 'package:mobile_computing_smart_home/screen/Home.dart';
import 'package:mobile_computing_smart_home/screen/login.dart';
import 'package:mobile_computing_smart_home/screen/profile.dart';
import 'package:mobile_computing_smart_home/screen/signup.dart';
import 'package:mobile_computing_smart_home/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_computing_smart_home/widget_tree.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),

      routes: {
        '/SignUp':(context)=> SignUp(),
        '/LogIn':(context)=> LoginPage(),
        '/Profile':(context)=> Profile(),
        '/Home' :(context) => Home(),
      },
    );
  }
}
