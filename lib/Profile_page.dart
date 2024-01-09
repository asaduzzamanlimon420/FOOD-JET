import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'account.dart';
import 'main.dart';

class Profile_page extends StatelessWidget{
  //const Profile_page({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.grey[300],
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
          ),
          //titleTextStyle: ,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Body(),
      ),
    );
  }
}

