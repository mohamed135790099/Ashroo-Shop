import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/logic/controllers/main_getx_controller.dart';
import 'package:sroo_shop/routes/routs.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:badges/badges.dart';

import '../../logic/controllers/cart_controller.dart';




class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final controller = Get.find<MainController>();
  final cartController=Get.find<CartController>();


  int _selectedPageIndex = 0;

  void _x1(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? mainColor:pinkClr,
          centerTitle: true,
          title: Text(
            controller.tabs[_selectedPageIndex].cast()['title'],
            style:GoogleFonts.bungeeInline(textStyle:TextStyle(color:Get.isDarkMode?Colors.white:Colors.white70,fontSize:20)),
          ),
          elevation: 0,
          leading:Container(),
          actions: [
          Obx(()=>Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: const Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(cartController.quantity().toString(),
              style:const TextStyle(color: Colors.white),
            ),
            child: InkWell(onTap:(){Get.offNamed(Routes.cartScreen);},child: Image.asset('assets/images/shop.png')),
        ),
          ),

          ],
        ),
        body: controller.tabs[_selectedPageIndex].cast()['page'],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _x1,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.category,
                    color: Get.isDarkMode ? Colors.black : Colors.white),
                label: '',
                activeIcon: Icon(Icons.category,
                    color: Get.isDarkMode ? mainColor : pinkClr)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,
                    color: Get.isDarkMode ? Colors.black : Colors.white),
                label: '',
                activeIcon: Icon(Icons.favorite,
                    color: Get.isDarkMode ? mainColor : pinkClr)),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings,
                    color: Get.isDarkMode ? Colors.black : Colors.white),
                label: '',
                activeIcon: Icon(Icons.settings,
                    color: Get.isDarkMode ? mainColor : pinkClr)),
          ],
        ),
      ),
    );
  }
}
