import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Profile_page.dart';
//import 'editProfile.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class account extends StatelessWidget {
  const account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Account',
           style: TextStyle(
             color: Colors.white70,
           ),
        ),

        // Add a back button in the top-left corner
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) => Profile_page()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("images/limon.jpg"),
            ),
            const SizedBox(height: 20),
            itemProfile("Name", "Asaduzzaman Limon", CupertinoIcons.person),
            const SizedBox(height: 15),
            itemProfile("User Name", "limon420", CupertinoIcons.profile_circled),
            const SizedBox(height: 15),
            itemProfile("Phone", "+8801309074981", CupertinoIcons.phone),
            const SizedBox(height: 15),
            itemProfile("Email", "adilarian420@gmail.com", CupertinoIcons.mail),
            const SizedBox(height: 40),
            SizedBox(

              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                      // MaterialPageRoute(builder: (context) => EditProfile()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemProfile(String title,String subtitle,IconData iconData){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}