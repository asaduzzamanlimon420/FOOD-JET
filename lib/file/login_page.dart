import 'package:flutter/material.dart';
//import 'package:food_jet/file/text_field.dart';

class LoginPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
               /* MyTextField(
                    obscureText: false,
                    hintText: 'Email'),
                /* textField(
                  iconColor: Colors.white,
                  hintText: "Username",
                  icon: Icons.person_outline,
                ),*/
                SizedBox(height: 30,),
                MyTextField(
                    obscureText: true,
                    hintText: 'Password'),
                /* textField(
                  iconColor: Colors.white,
                  icon: Icons.lock_outline,
                  hintText: "password",
                ),*/
              ],
            ),*/
                Container(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text("New User?", style: TextStyle(color: Colors.grey)),
                    Text("Register now.", style: TextStyle(color: Colors.red)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}