import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'file/account.dart';
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            //  );
            },
          textColor: Colors.black87,
        ),
        profile_menu(
          icon: "images/messages.png",
          text: "Messages",
          press: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            // );
          },
          textColor: Colors.black87,
        ),
        profile_menu(
          icon: "images/bell.png",
          text: "Notifications",
          press: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            // );
          },
          textColor: Colors.black87,
        ),
        profile_menu(
          icon: "images/log out.png",
          text: "Log Out",
          press: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            // );
          },
          textColor: Colors.red,
        ),
      ],
    );
  }
}

class profile_pic extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/limon.jpg"),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 40,
              width: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  shadowColor: Colors.blueGrey,
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.zero,
                  side: BorderSide(color: Colors.white10),
                ),
                child: ClipOval(
                  child: SvgPicture.asset( // Use SvgPicture.asset instead of Image.asset
                    "images/camera.svg",
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class profile_menu extends StatelessWidget {
  const profile_menu({

    required this.text,
    required this.icon,
    required this.press,
    required this.textColor,
  }) : super();
  final String text,icon;
  final VoidCallback press;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[400],
            fixedSize: Size(450, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),

        onPressed: press,
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                icon,
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
