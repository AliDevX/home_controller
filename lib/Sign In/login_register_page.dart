import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_computing_smart_home/auth.dart';
import 'package:snippet_coder_utils/hex_color.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  late DatabaseReference userDB;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();



  Future<void> signInWithEmailAndPassword() async {
    try{
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text.trim(),
          password: _controllerPassword.text.trim(),
      );
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
      Map<String, String> Users = {
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email':_controllerEmail.text,
        'password': _controllerPassword.text
      };
      print(Users);
      userDB.push().set(Users);
    } on FirebaseAuthException catch(e) {
      setState(() {
        errorMessage = e.message;
      });
    }

  }


  Widget _errorMessage(){
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
      isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegistrationButton() {
    return TextButton(
        onPressed: (){
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin? 'Register instead ' : 'Login instead'),
    );
  }
  @override
  void initState(){
    super.initState();
    userDB = FirebaseDatabase.instance.ref().child('Users');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: isLogin?
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(left: 100, top: 180),
              child: Text(
                "SMART HOME",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                child: TextFormField(
                  validator: (Value) {
                    if (Value == null || Value.isEmpty) {
                      return "email cannot be empty";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white,),
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'email',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#6FC1C5'),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                child: TextFormField(
                  validator: (Value) {
                    if (Value == null || Value.isEmpty) {
                      return "password cannot be empty";
                    }
                    return null;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white,),
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#6FC1C5'),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 20,),
            Center(child: _submitButton()),
            SizedBox(height: 10,),
            Center(
              child: Text(
                "OR",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(child: _loginOrRegistrationButton()),
            Center(child: _errorMessage()),
          ],
        )
            :
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, top: 80),
              child: Text(
                "SignUp to SMART HOME",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: HexColor('#6FC1C5'),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: TextFormField(
                  // ignore: non_constant_identifier_names
                  validator: (Value) {
                    if (Value == null || Value.isEmpty) {
                      return "First Name cannot be empty";
                    } else if (Value.length < 3) {
                      return 'First Name must be more than 2 character';
                    }
                    return null;
                  },
                  // onSaved: ((newValue) {
                  //   firstName = newValue;
                  // }),
                  style: TextStyle(color: Colors.white,),
                  controller: firstNameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'FirstName',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.person,color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#6FC1C5'),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: TextFormField(
                  validator: (Value) {
                    if (Value == null || Value.isEmpty) {
                      return "Last Name cannot be empty";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white,),
                  controller: lastNameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'LastName',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.person,color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#6FC1C5'),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: TextFormField(
                  validator: (Value) {
                    if (Value == null || Value.isEmpty) {
                      return "email cannot be empty";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white,),
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'email',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#6FC1C5'),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: TextFormField(
                  validator: (Value) {
                    if (Value == null || Value.isEmpty) {
                      return "password cannot be empty";
                    }
                    return null;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white,),
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.key,color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#6FC1C5'),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: TextFormField(
                  validator: (Value) {
                    if (Value == null || Value.isEmpty) {
                      return "password cannot be empty";
                    } else if (Value != _controllerPassword.text) {
                      return "password doesn't Match";
                    }
                    return null;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white,),
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: 'ConfirmPassword',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.key,color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#6FC1C5'),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: _submitButton()),
            Center(
              child: Text(
                "OR",
                style: TextStyle(
                    color: HexColor('#6FC1C5'),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(child: _loginOrRegistrationButton()),
            Center(child: _errorMessage()),
          ],
        ),
      ),

    );
  }
}
