
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/models/product_models.dart';
import 'package:sroo_shop/routes/routs.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {
  var productMap = {}.obs;
  void addProductToCart(Products products) {
    if (productMap.containsKey(products)) {
      productMap[products] += 1;
    } else {
      productMap[products] = 1;
    }
  }

  void removeProductFromCart(Products products) {
    if (productMap.containsKey(products) && productMap[products] == 1) {
      productMap.removeWhere((key, value) => key == products);
    } else {
      productMap[products] -= 1;
    }
  }
  void removeOneProduct(Products products){
    productMap.removeWhere((key, value) => key == products);
  }
  void removeAllProduct(){
    Get.defaultDialog(
          title: "Clean Products",
        titleStyle:  GoogleFonts.abhayaLibre(
            textStyle: const TextStyle(
              fontSize: 18,
              color:Colors.white38,
              fontWeight: FontWeight.bold,
            )),
        middleText:"Are you sure you need clear products ?",
        middleTextStyle: GoogleFonts.abhayaLibre(
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white38,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor:Get.isDarkMode?darkGreyClr:Colors.grey,
        textCancel:"No",
        cancelTextColor:Colors.white,
        textConfirm: "Yes",
        confirmTextColor: Colors.white,
        onCancel:(){
          Get.offNamed(Routes.cartScreen);
        },
        onConfirm: (){
          productMap.clear();
          Get.offNamed(Routes.mainScreen);

        },
        buttonColor:Get.isDarkMode?mainColor:pinkClr
    );

  }

  get subtotal {
    return productMap.entries.map((e) => e.key.price * e.value).toList();
  }

  get total {
    if(productMap.isEmpty){return "0.0";}
    else {
      return productMap.entries.map((e) => e.key.price * e.value)
          .toList()
          .reduce(
              (value, element) => value + element)
          .toStringAsFixed(2);
    }
  }

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    }
    else {
      return productMap.entries
          .map((e)=> e.value).toList().reduce((value, element) => value+element);
    }
  }
}
