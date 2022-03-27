import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

class AuthButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const AuthButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
        primary:Get.isDarkMode?mainColor:pinkClr,
        minimumSize:const Size(360, 50),
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadiusDirectional.circular(10),
        )
      ),
      onPressed: onPressed,
      child: TextUtils(fontSize:18,fontWeight:FontWeight.bold,googleFont:GoogleFonts.lato,textDecoration:TextDecoration.none,text:text,color:Colors.white,),
    );
  }
}
