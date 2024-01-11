import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  Widget button({required String name, required Color color, required Color textColor}) {
    return SizedBox(
      height: 45,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(child: Image.asset('images/logo.png')),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Welcome To FOODJET",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Column(
                  children: [
                    Text("Order food from our restaurant and"),
                    Text("Make reservation in real-time"),
                  ],
                ),
                button(
                  name: 'Login',
                  color: Colors.green,
                  textColor: Colors.white,
                ),
                button(
                  name: 'SignUp',
                  color: Colors.white,
                  textColor: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
