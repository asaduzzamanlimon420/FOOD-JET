//import 'package:auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_jet/file/home_screen.dart';
import 'package:food_jet/login_or_register_page.dart';
//import 'package:food_jet/login_page.dart';

class AuthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return HomeScreen();
          }
          else{
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }


}