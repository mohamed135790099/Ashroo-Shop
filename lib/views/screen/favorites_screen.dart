import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

import '../../logic/controllers/products_controlller.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final controller=Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if(controller.favoritesList.isEmpty){
          return Scaffold(
              backgroundColor: context.theme.backgroundColor,
              body:nullFavorites(),
          );
        }
        else {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration:BoxDecoration(
                            color:Get.isDarkMode?Colors.black:Colors.white,
                            borderRadius:BorderRadius.circular(10),
                        ),
                          child: Card(
                            color:Colors.white,
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              controller.favoritesList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),

                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextUtils(
                            googleFont: GoogleFonts.arefRuqaa,
                            text: controller.favoritesList[index].title,
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.none,
                          ),
                          const SizedBox(height: 10,),
                          TextUtils(
                            googleFont: GoogleFonts.arefRuqaa,
                            text: "\$${controller.favoritesList[index].price}",
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.none,
                          ),
                          Row(
                            children: [
                              TextUtils(
                                googleFont: GoogleFonts.arefRuqaa,
                                text: "${controller.favoritesList[index].rating
                                    .rate}",
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                textDecoration: TextDecoration.none,
                              ),
                              const Icon(Icons.star, color: Colors.greenAccent,)
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(onPressed: () {
                      controller.manageFavorite(controller.favoritesList[index].id);
                    },
                      icon: const Icon(Icons.favorite),
                      color: Get.isDarkMode ? mainColor : Colors.red,)
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 20,
                  thickness: 1,
                );
              },
              itemCount: controller.favoritesList.length,
            ),
          );
        }
      },
      ));
  }


  Center nullFavorites() {
    return Center(
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal:5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 120,
                height: 120,
                child: Image.asset('assets/images/heart.png')),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
                googleFont: GoogleFonts.alike,
                text: "Please, Add your favorites products.",
                color: Get.isDarkMode ? Colors.black : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none),
          ],
        ),
      ),
    );
  }
}
