import 'package:flutter/material.dart';
import 'package:mobile_computing_smart_home/auth.dart';
import 'package:mobile_computing_smart_home/Sign In/login_register_page.dart';
import 'package:mobile_computing_smart_home/screen/Home.dart';


class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Home();
        } else {
          return const LoginPage();
        }
      }
    );
  }
}
