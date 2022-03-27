import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/models/product_models.dart';

import '../../../logic/controllers/cart_controller.dart';

class CartItems extends StatelessWidget {
  final Products products;
  final int indexCome;
  final int quantity;
  final controller=Get.find<CartController>();
  CartItems({Key? key,required this.products, required this.indexCome,required this.quantity}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: Get.isDarkMode?Colors.black.withOpacity(0.1):Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image:  DecorationImage(
                        image: NetworkImage(
                          products.image
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(width:10,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text(products.title,
                    style: GoogleFonts.amarante(
                   textStyle:  TextStyle(
                      overflow:TextOverflow.ellipsis ,
                      color: Get.isDarkMode?Colors.black:Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  const SizedBox(height:10,),
                  Text(
                    "\$${controller.subtotal[indexCome].toStringAsFixed(2)}",
                    style: GoogleFonts.amarante(
                        textStyle:  TextStyle(
                          overflow:TextOverflow.ellipsis ,
                          color: Get.isDarkMode?Colors.black:Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),

                ],
              ),
            ),
            Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){controller.removeProductFromCart(products);}, icon: Icon(Icons.remove_circle,color:Get.isDarkMode?Colors.black:Colors.white,)),
                    Text("$quantity",style: TextStyle(
                      overflow:TextOverflow.ellipsis ,
                      color: Get.isDarkMode?Colors.black:Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    IconButton(onPressed: (){controller.addProductToCart(products);}, icon: Icon(Icons.add_circle,color:Get.isDarkMode?Colors.black:Colors.white,)),

                  ],
                ),
                InkWell(onTap:(){controller.removeOneProduct(products);},child: Icon(Icons.delete,color:Get.isDarkMode?Colors.black:Colors.white,)),
              ],
            )

          ],
        ),
      ),
    );
  }
}
