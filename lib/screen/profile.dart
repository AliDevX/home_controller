import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_computing_smart_home/auth.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }
  Widget _userid(){
    return Text(user?.email ?? 'User email');
  }
  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: (){signOut();
        Navigator.pop(context);
      },
      child: const Text('Sign Out'),
    );
  }

  late DatabaseReference userDB;

  void initState(){
    super.initState();
    Query userDB = FirebaseDatabase.instance.ref().child('Users');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),

        backgroundColor: Color(0x44000000),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const Padding(
            padding: EdgeInsets.only(bottom:45), //apply padding to all four sides
            child: Text("User Profile", style: TextStyle(color: Colors.white, fontSize:35.0 )),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom:45),
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor:Colors.white,
            ),
          ),
          _userid(),
          Card(
            color: HexColor('242424'),
            shape: RoundedRectangleBorder( //<-- SEE HERE
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.person,color: Colors.white,),
                    title: Text('Name',style: TextStyle(color: Colors.grey)),
                    subtitle: Text('Abel Abebe',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 24)),
                  ),
                ]
            ),
          ),
          Card(
            color: HexColor('242424'),
            shape: RoundedRectangleBorder( //<-- SEE HERE
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.email,color: Colors.white,),
                    title: Text('email',style: TextStyle(color: Colors.grey)),
                    subtitle: Text('abel@gmail.com',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 24)),
                  ),
                ]
            ),
          ),
          Card(
            color: HexColor('242424'),
            shape: RoundedRectangleBorder( //<-- SEE HERE
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.phone,color: Colors.grey,),
                    title: Text('phone',style: TextStyle(color: Colors.grey)),
                    subtitle: Text('+2519******',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 24)),
                  ),
                ]
            ),
          ),
          _signOutButton(),
        ],
      ),
    );
  }
}

