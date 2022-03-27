import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sroo_shop/models/product_models.dart';
import '../../utils/theme.dart';
import '../widget/productDetails/add_cart.dart';
import '../widget/productDetails/clothes_info.dart';
import '../widget/productDetails/image_sliders.dart';
import '../widget/productDetails/size_list.dart';

class ProductDetails extends StatelessWidget {
  final Products products;

  const ProductDetails({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ImageSliders(
                      imageUrl: products.image,
                    ),
                    ClothesInfo(
                      title: products.title,
                      productId: products.id,
                      rating: products.rating.rate,
                      description:products.description,
                    ),
                    const SizedBox(height:20,),
                    const SizeList(),
                  ],
                ),
              ),
            ),
            BottomAppBar(
              elevation:0,
              child: Container(
                padding:const EdgeInsets.only(bottom:20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Get.isDarkMode?Colors.white:darkGreyClr,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AddCart(price:products.price,products:products,),
                  ],
                ),
              ),
            ),
          ],
    
      ),
    ));
  }
}
