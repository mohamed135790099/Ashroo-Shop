import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/logic/controllers/settings_controller.dart';
import 'package:sroo_shop/utils/my_string.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final settingController=Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder:(_)=>Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconButton(),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Get.isDarkMode ? Colors.black : Colors.grey,
                width: 2,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(15),
                style: const TextStyle(color: Colors.white),
                dropdownColor: Get.isDarkMode ? Colors.black : Colors.grey,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  size: 25,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      english,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                    value: ene,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      arabic,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                    value: ara,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      french,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                    value: frf,
                  ),
                ],
                value: settingController.langLocal,
                onChanged: (value) {
                  settingController.changeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
              ),
            ),
          ),
        ],
      ),
    );
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
              color: languageSettings,
            ),
            child: Icon(
              Icons.language,
              color: Get.isDarkMode ? Colors.black : Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            googleFont: GoogleFonts.adamina,
            text: "Language".tr,
            color: Get.isDarkMode ? Colors.black : Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none,
          )
        ],
      ),
    );
  }
}
