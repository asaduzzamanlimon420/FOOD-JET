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
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        profile_pic(),
        SizedBox(height: 30),
        profile_menu(
          icon: "images/profile.png",
          text: "My Account",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => account()),
            );
          },
          textColor: Colors.black87,
        ),
        profile_menu(
          icon: "images/setting.png",
          text: "Settings",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          textColor: Colors.black87,
        ),
        profile_menu(
          icon: "images/messages.png",
          text: "Messages",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          textColor: Colors.black87,
        ),
        profile_menu(
          icon: "images/bell.png",
          text: "Notifications",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          textColor: Colors.black87,
        ),
        profile_menu(
          icon: "images/log out.png",
          text: "Log Out",
          press: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          textColor: Colors.red,
        ),
      ],
    );
  }
}


