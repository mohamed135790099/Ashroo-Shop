import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;
  const ContainerUnder({Key? key, required this.text, required this.textType, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration:  BoxDecoration(
        color: Get.isDarkMode?mainColor:pinkClr,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          TextUtils(
            googleFont: GoogleFonts.anticDidone,
            text: text,
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none,
          ),
          TextButton(onPressed:onPressed, child:   TextUtils(
            googleFont: GoogleFonts.anticDidone,
            text:textType,
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.underline,
          )),
        ],
      ),
    );
  }
}
