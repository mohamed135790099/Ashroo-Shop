import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/logic/controllers/cart_controller.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

class CartTotal extends StatelessWidget {
  final controller=Get.find<CartController>();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            TextUtils(
              googleFont: GoogleFonts.amarante,
              text: "Total",
              color: Get.isDarkMode?Colors.black:Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textDecoration: TextDecoration.none,
            ),
            const SizedBox(height:10,),
            Text("\$${controller.total}",style:GoogleFonts.amarante(
             textStyle:  TextStyle(
               color: Get.isDarkMode?Colors.black:Colors.white,
               fontSize: 20,
               fontWeight: FontWeight.bold,
               decoration:TextDecoration.underline,
             ),

            ),)
          ],
        ),
        const SizedBox(width:20,),
        Expanded(child:SizedBox(
          height:60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary:Get.isDarkMode?mainColor:pinkClr.withOpacity(0.3),
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20)
              ),

            ),
            onPressed:(){},
            child:Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text("Check Out",style:GoogleFonts.amarante(
                        textStyle:  TextStyle(
                        color: Get.isDarkMode?Colors.black:Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration:TextDecoration.none,
               ))),
                const SizedBox(width:5,),
                Icon(Icons.shopping_cart,color:Get.isDarkMode?pinkClr:mainColor,size:30,)

              ],
            ),
          ),
        )),
      ],
    );
  }
}
