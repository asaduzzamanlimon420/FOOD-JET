import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_jet/auth_page.dart';
import 'package:get/get.dart';
import 'package:food_jet/file/welcome_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: AuthPage(),

    );
  }

}
