import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

import '../../../logic/controllers/auth_getx_controller.dart';
import '../../../logic/controllers/settings_controller.dart';

class ProfileWidget extends StatelessWidget {
  final controller=Get.find<SettingsController>();
  final authController=Get.find<AuthController>();
  ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Get.isDarkMode ? mainColor : pinkClr,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(authController.displayUserPhoto.value),
                )),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            TextUtils(
              googleFont:GoogleFonts.adamina,
              text:controller.capitalize(authController.displayUserName.value),
              color:Get.isDarkMode?Colors.black:Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textDecoration:TextDecoration.none,
            ),
            const SizedBox(height:3,),
            TextUtils(
              googleFont:GoogleFonts.adamina,
              text: authController.displayUserEmail.value,
              color:Get.isDarkMode?Colors.grey:Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              textDecoration:TextDecoration.none,
            ),

          ],
        ),

      ],
    ));
  }
}
