import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/models/product_models.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';
class AddCart extends StatelessWidget {
  final double price;
  final Products products;
  final controller=Get.find<CartController>();
  AddCart({Key? key, required this.price, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:20,left:20,top:10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              TextUtils(
                googleFont: GoogleFonts.atma,
                text: "Price",
                color: Get.isDarkMode?Colors.black:Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none,
              ),
              const SizedBox(height:5,),
              Text("\$$price",style:GoogleFonts.atma(
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
                primary:Get.isDarkMode?mainColor:pinkClr,
                shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(20)
                ),

              ),
              onPressed:(){controller.addProductToCart(products);},
              child:Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text("Check Out",style:GoogleFonts.atma(
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
      ),
    );
  }
}
