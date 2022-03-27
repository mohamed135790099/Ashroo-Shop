import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../logic/controllers/auth_getx_controller.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogoutWidget extends StatelessWidget {
  final controller=Get.find<AuthController>();
  LogoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildIconButton();
  }
  Material buildIconButton() {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor:Get.isDarkMode?mainColor.withOpacity(0.4):pinkClr,
          focusColor:Colors.red,
          borderRadius:BorderRadius.circular(15),
          onTap:(){
            Get.defaultDialog(
                title: "Logout From App",
                titleStyle: GoogleFonts.abhayaLibre(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white38,
                      fontWeight: FontWeight.bold,
                    )),
                middleText: "Are you sure you need to logout ?",
                middleTextStyle: GoogleFonts.abhayaLibre(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white38,
                      fontWeight: FontWeight.bold,
                    )),
                backgroundColor:
                Get.isDarkMode ? darkGreyClr : Colors.grey,
                textCancel: "No",
                cancelTextColor: Colors.white,
                textConfirm: "Yes",
                confirmTextColor: Colors.white,
                onCancel: () {
                  Get.back();
                },
                onConfirm: () {
                  controller.signOutFromApp();
                },
                buttonColor: Get.isDarkMode ? mainColor : pinkClr);
          },
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: Icon(
                  Icons.logout,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                googleFont: GoogleFonts.adamina,
                text: "Logout".tr,
                color: Get.isDarkMode?Colors.black:Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none,
              )
            ],
          ),
        ));
  }
}
