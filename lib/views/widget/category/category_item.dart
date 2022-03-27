import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/category_controller.dart';
import '../../../logic/controllers/products_controlller.dart';
import '../../../models/product_models.dart';
import '../../../utils/theme.dart';
import '../../screen/product_detail_screen.dart';
import '../text_utils.dart';
class CategoryItem extends StatelessWidget {
  String categoryNameList;

  CategoryItem(this.categoryNameList, {Key? key}) : super(key: key);
  final controller = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  var categoryController=Get.find<CategoryController>();


   @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:context.theme.backgroundColor,
          appBar:AppBar(
            backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
            elevation: 0,
            title: Text(
              categoryNameList,
              style: GoogleFonts.bungeeInline(
                  textStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white)),
            ),
            centerTitle: true,
            leading:IconButton(onPressed:(){
              Get.back();
            },icon:const Icon(Icons.arrow_back),),

          ),
          body: Obx(() {
            if(categoryController.isCategoryLoading.value){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 9,
                    ),
                    itemBuilder: (context, index) {
                      return buildCard(
                          image: categoryController.categoryList[index].image,
                          price: categoryController.categoryList[index].price,
                          rating: categoryController.categoryList[index].rating
                              .rate,
                          productId: categoryController.categoryList[index].id,
                          products: categoryController.categoryList[index],
                          onTap: () {
                            Get.to(() =>
                                ProductDetails(
                                  products: categoryController
                                      .categoryList[index],
                                ));
                          });
                    },
                    itemCount: categoryController.categoryList.length
                ),
              );
            }
      }),
    ));
  }
   Widget buildCard({
     required String image,
     required double price,
     required var rating,
     required int productId,
     required Products products,
     required Function() onTap,
   }) {
     return Card(
       color: Colors.white,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(15.0),
       ),
       child: SingleChildScrollView(
         child: Column(
           children: [
             Obx(() => Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   IconButton(
                       onPressed: () {
                         controller.manageFavorite(productId);
                       },
                       icon: controller.isFavorite(productId)
                           ? const Icon(
                         Icons.favorite,
                         color: Colors.red,
                       )
                           : const Icon(
                         Icons.favorite_border,
                         color: Colors.black,
                       )),
                   TextUtils(
                       googleFont: GoogleFonts.enriqueta,
                       text: "Guess",
                       color: Colors.black,
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       textDecoration: TextDecoration.none),
                   IconButton(
                       onPressed: () {
                         cartController.addProductToCart(products);
                       },
                       icon: const Icon(
                         Icons.shopping_cart,
                         color: Colors.black,
                       )),
                 ],
               ),
             ),
             Stack(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: SizedBox(
                     width: double.infinity,
                     height: 150,
                     child: ClipRRect(
                         borderRadius: BorderRadius.circular(15.0),
                         child: InkWell(
                           onTap: () {
                             onTap();
                           },
                           child: Image.network(
                             image,
                             fit: BoxFit.cover,
                           ),
                         )),
                   ),
                 ),
                 Positioned(
                   left: 10,
                   bottom: 20,
                   child: Container(
                     height: 25,
                     width: 120,
                     decoration: BoxDecoration(
                       color: Colors.grey.withOpacity(0.65),
                       borderRadius: const BorderRadius.only(
                         bottomLeft: Radius.circular(20),
                         bottomRight: Radius.circular(20),
                         topLeft: Radius.circular(20),
                         topRight: Radius.circular(20),
                       ),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         TextUtils(
                             googleFont: GoogleFonts.amaranth,
                             text: "$rating",
                             color: Colors.black,
                             fontSize: 16,
                             fontWeight: FontWeight.bold,
                             textDecoration: TextDecoration.none),
                         Icon(
                           Icons.star,
                           color:
                           Get.isDarkMode ? Colors.red : Colors.blueAccent,
                         ),
                         const SizedBox(
                           width: 10,
                         ),
                         TextUtils(
                             googleFont: GoogleFonts.amaranth,
                             text: "\$$price",
                             color: Colors.black,
                             fontSize: 16,
                             fontWeight: FontWeight.bold,
                             textDecoration: TextDecoration.none)
                       ],
                     ),
                   ),
                 )
               ],
             ),
           ],
         ),
       ),
     );
   }
}
