import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

import '../../../logic/controllers/settings_controller.dart';
import '../../../utils/theme.dart';
import '../../../utils/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
  final controller=Get.find<SettingsController>();

 DarkModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconButton(),
        Switch(
            inactiveTrackColor:Get.isDarkMode?mainColor:Colors.grey,
            activeColor:Get.isDarkMode?mainColor:pinkClr,
            activeTrackColor:Get.isDarkMode?mainColor:pinkClr,
            value: controller.changeSwitch.value, onChanged: (value){
          ThemeController().changeTheme();
          controller.changeSwitch.value=value;
        }),
      ],
    ));
  }

  Material buildIconButton() {
    return Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: darkSettings,
                ),
                child: Icon(
                  Icons.dark_mode,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                googleFont: GoogleFonts.adamina,
                text: "Dark Mode",
                color: Get.isDarkMode?Colors.black:Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none,
              )
            ],
          ));
  }


}
