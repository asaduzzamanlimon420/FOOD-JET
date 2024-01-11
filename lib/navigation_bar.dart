import 'package:flutter/material.dart';
import 'package:food_jet/Profile_page.dart';
import 'package:food_jet/file/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:food_jet/cart_page.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value=index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_filled) , label: 'Home'),
            NavigationDestination(icon: Icon(Icons.food_bank_outlined) , label: 'Food'),
            NavigationDestination(icon: Icon(Icons.shopping_cart) , label: 'Cart'),
            NavigationDestination(icon: Icon(Icons.person) , label: 'Home'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex =0.obs;

  final screens =[HomeScreen(),Container(color: Colors.purple,),ShoppingCart(),const Profile_page()];
}
