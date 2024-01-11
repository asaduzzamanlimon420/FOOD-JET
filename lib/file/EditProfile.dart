// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'account.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {

  bool showPassword =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),

        // Add a back button in the top-left corner
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => account()));
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: ListView(
              children: [
                const SizedBox(height: 5,),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0,10),
                              )
                            ],
                            shape: BoxShape.circle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png"),
                          )
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.tealAccent,
                            padding: const EdgeInsets.all(10),
                            side: const BorderSide(
                              width: 2.5,  // Adjust the width of the border
                              color: Colors.white,  // Adjust the color of the border
                            ),
                          ),
                          child: const Icon(Icons.edit, color: Colors.white),
                        ),
                      )

                    ],
                  ),
                ),
                const SizedBox(height: 35),
                buildTextField("Full Name","Asaduzzaman Limon",false),
                buildTextField("User Name","limon420",false),
                buildTextField("Password","*********",true),
                buildTextField("E-mail","adilarian***@gmail.com",false),
                const SizedBox(height: 35),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(color: Colors.black),
                        ),
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => account()));
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black
                            ),
                          ),
                      ),
                      ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: (){},
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String labelText,String placeholder,bool isPassTextField){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: TextField(
          obscureText: isPassTextField ? showPassword :false,
          decoration: InputDecoration(
            suffixIcon: isPassTextField ? IconButton(
              icon: const Icon(Icons.remove_red_eye),
              color: Colors.grey,
              onPressed: () {
                setState((){
                  showPassword = !showPassword;
                });
              },
            ) : null,
              contentPadding: const EdgeInsets.only(bottom: 3),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle:
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )
          ),
        ),
      ),
    );
  }

}