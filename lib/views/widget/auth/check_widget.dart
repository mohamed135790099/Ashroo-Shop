import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/logic/controllers/auth_getx_controller.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);
  final controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder:(_)=> Row(
        children: [
          InkWell(
            onTap:(){
              controller.checkBox();
            },
            child: Container(
              height:35,
              width:35,
              decoration:BoxDecoration(
                color:Colors.grey.shade200,
                borderRadius:BorderRadiusDirectional.circular(10),
              ),
              child:controller.isCheck?Get.isDarkMode?Image.asset('assets/images/check.png'):const Icon(Icons.check,color:pinkClr,size:30,):Container(),
            ),
          ),
          const SizedBox(width:7,),
          TextUtils(googleFont: GoogleFonts.lato, text: 'I accept ', color:Get.isDarkMode?Colors.black:Colors.white, fontSize: 16, fontWeight: FontWeight.normal, textDecoration: TextDecoration.none),
          InkWell(onTap:(){},child: TextUtils(googleFont: GoogleFonts.lato, text: 'terms&conditions', color:Get.isDarkMode?Colors.black:Colors.white, fontSize: 16, fontWeight: FontWeight.normal, textDecoration: TextDecoration.underline))

        ],
      ),
    );
  }
}
