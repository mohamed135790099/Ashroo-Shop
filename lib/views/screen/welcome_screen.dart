import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/routes/routs.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

import '../../utils/theme.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                SizedBox(
                    child: TextUtils(
                        color: Colors.white,
                        textDecoration: TextDecoration.none,
                        fontSize: 35,
                        text: 'Welcome',
                        googleFont: GoogleFonts.aclonica,
                        fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        color: mainColor,
                        textDecoration: TextDecoration.none,
                        fontSize: 35,
                        text: 'ASroo',
                        googleFont: GoogleFonts.aclonica,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      width: 5,
                    ),
                    TextUtils(
                        color: Colors.white,
                        textDecoration: TextDecoration.none,
                        fontSize: 35,
                        text: 'Shop',
                        googleFont: GoogleFonts.aclonica,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 40),
                  ),
                  onPressed: () {
                  Get.offAllNamed(AppRoutes.loginRoute);
                  },
                  child: TextUtils(
                    color: Colors.white,
                    textDecoration: TextDecoration.none,
                    fontSize: 22,
                    text: 'Get Start',
                    googleFont: GoogleFonts.lato,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        color: Colors.white,
                        textDecoration: TextDecoration.none,
                        fontSize: 18,
                        text: "Don't have any account?",
                        googleFont: GoogleFonts.anticDidone,
                        fontWeight: FontWeight.normal),
                    const SizedBox(
                      width: 3,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(AppRoutes.signUpRoute);
                      },
                      child: TextUtils(
                          color: Colors.white,
                          textDecoration: TextDecoration.underline,
                          fontSize: 18,
                          text: "SignUP",
                          googleFont: GoogleFonts.anticDidone,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
