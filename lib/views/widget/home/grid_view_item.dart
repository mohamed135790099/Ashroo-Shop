import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/logic/controllers/cart_controller.dart';
import 'package:sroo_shop/models/product_models.dart';
import 'package:sroo_shop/views/screen/product_detail_screen.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

import '../../../logic/controllers/products_controlller.dart';

class GridViewItem extends StatelessWidget {
  final controller = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();

  GridViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return controller.searchList.isEmpty &&
                controller.searchTextController.value.text.isNotEmpty
            ? Get.isDarkMode
                ? Container(
                 height:250,
                 width:400,
                 alignment:Alignment.bottomCenter,
                  child: Container(
                    height:250,
                    width:400,
                    alignment:Alignment.bottomCenter,
                    child: Image.asset(
                        'assets/images/search_empty_dark.png',
                        fit: BoxFit.cover,
                      ),
                  ),
                )
                : Container(
                  height:250,
                  width:400,
                  alignment:Alignment.bottomCenter,
                  child: Image.asset(
                      'assets/images/search_empry_light.png',
                      fit: BoxFit.cover,
                    ),
                )
            : Expanded(
                child: Padding(
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
                      if (controller.searchList.isEmpty) {
                        return buildCard(
                            image: controller.productList[index].image,
                            price: controller.productList[index].price,
                            rating: controller.productList[index].rating.rate,
                            productId: controller.productList[index].id,
                            products: controller.productList[index],
                            onTap: () {
                              Get.to(() => ProductDetails(
                                    products: controller.productList[index],
                                  ));
                            });
                      } else {
                        return buildCard(
                            image: controller.searchList[index].image,
                            price: controller.searchList[index].price,
                            rating: controller.searchList[index].rating.rate,
                            productId: controller.searchList[index].id,
                            products: controller.searchList[index],
                            onTap: () {
                              Get.to(() => ProductDetails(
                                    products: controller.productList[index],
                                  ));
                            });
                      }
                    },
                    itemCount: controller.searchList.isEmpty
                        ? controller.productList.length
                        : controller.searchList.length,
                  ),
                ),
              );
      }
    });
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
            Obx(
              () => Row(
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
