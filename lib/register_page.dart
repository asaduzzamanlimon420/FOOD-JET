
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_jet/components/MyTextField.dart';
import 'package:food_jet/components/my_button.dart';
import 'package:food_jet/navigation_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'components/square_tiles.dart';
import 'models/auth_service.dart';
class RegisterPage extends StatefulWidget{
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController= TextEditingController();

  void signUserUp() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        Get.back(); // Close the dialog
        Get.off(() => const NavigationMenu()); // Navigate to NavigationMenu and remove all previous routes
      } else {
        Get.back(); // Close the dialog
        showErrorMsg('Password don\'t match');
      }
    } on FirebaseAuthException catch (e) {
      Get.back(); // Close the dialog
      showErrorMsg(e.code);
    }
  }
  void showErrorMsg(String message){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
  /*void wrongPasswordMsg() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect password dumbo!'),
        );
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 50,
                ),
                const SizedBox(height: 40),
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  obscureText: false,
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.person_outline_outlined),
                  labelText: 'Email',
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  obscureText: true,
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: 'Password',
                  suffixIcon: const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  hintText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: 'Confirm Password',
                  suffixIcon: const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: signUserUp, text: 'Sign Up',
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        onTap: ()=>AuthService().signInWithGoogle(),
                        imagePath: 'images/google.png'),
                    SizedBox(width: 25),
                    SquareTile(imagePath: 'images/telephone-call.png')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


