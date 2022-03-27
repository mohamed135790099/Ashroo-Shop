import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/logic/controllers/cart_controller.dart';
import 'package:sroo_shop/routes/routs.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/cart/cart_items.dart';

import '../widget/cart/cart_empty.dart';
import '../widget/cart/cart_total.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller=Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
       backgroundColor: context.theme.backgroundColor,
       appBar: AppBar(
        backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
        elevation: 0,
        title: Text(
          "Cart Items",
          style: GoogleFonts.bungeeInline(
              textStyle: TextStyle(
                  color: Get.isDarkMode ? Colors.black : Colors.white)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.removeAllProduct();
              },
              icon: const Icon(
                Icons.backspace,
              ))
        ],
         leading:IconButton(onPressed:(){
           Get.offNamed(AppRoutes.mainScreen);
         },icon:const Icon(Icons.arrow_back),),
      ),
       body:Obx((){
         if(controller.productMap.isEmpty){
           return const EmptyCart();
         }
         else{
           return  SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(
                   height: 660,
                   child: Column(
                     children: [
                       Expanded(
                         child: ListView.separated(
                           itemBuilder: (context, index) {
                             return  CartItems(
                               products:controller.productMap.keys.toList()[index],
                               quantity: controller.productMap.values.toList()[index],
                               indexCome:index,
                             );
                           },
                           separatorBuilder: (context, index) => const SizedBox(
                             height: 10,
                           ),
                           itemCount: controller.productMap.length,
                         ),
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                   child: CartTotal(),
                 ),
               ],
             ),
           );
         }
       }
       )
      ),
    );
  }
}
