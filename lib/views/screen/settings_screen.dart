import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

import '../widget/settings/dark_mode_widget.dart';
import '../widget/settings/language_widget.dart';
import '../widget/settings/logout_widget.dart';
import '../widget/settings/profile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            ProfileWidget(),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
                googleFont: GoogleFonts.adamina,
                text: "GENERAL",
                color: Get.isDarkMode?mainColor:pinkClr,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none),
            const SizedBox(
              height: 20,
            ),
            DarkModeWidget(),
            const SizedBox(
              height: 20,
            ),
            LanguageWidget(),
            const SizedBox(
              height: 20,
            ),
           LogoutWidget(),



          ],
        ));
  }

}
