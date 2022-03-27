import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sroo_shop/logic/controllers/products_controlller.dart';

class SearchTextFrom extends StatelessWidget {
  SearchTextFrom({Key? key}) : super(key: key);
  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder:(_)=>SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.8,
      child: TextFormField(
        controller: controller.searchTextController.value,
        onChanged: (searchName) {
          controller.searchProducts(searchName);
        },
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchTextController.value.text.isNotEmpty?IconButton(onPressed: () {
            controller.searchClear();
          },
            icon: const Icon(Icons.clear, color: Colors.black,),):null,
          hintText: "Search you're looking for",
          hintStyle: const TextStyle(fontSize: 12,color:Colors.black45,
              fontWeight:FontWeight.w500),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ), // OutlineInputBorder
        ),
      ),));
  }
}
