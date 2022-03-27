import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sroo_shop/models/product_models.dart';

import '../../services/products_services.dart';

class ProductsController extends GetxController {
  var isLoading = false.obs;
  var productList = <Products>[].obs;
  var favoritesList = <Products>[].obs;
  var isFav = false;
  GetStorage boxStorage = GetStorage();
  List? storedShopping;

  //logic search
  var searchList = <Products>[].obs;
  Rx<TextEditingController> searchTextController = TextEditingController().obs;


  @override
  void onInit() async {
    super.onInit();
    getProducts();
    storedShopping = boxStorage.read<List>("isFavoritesList");
    if (storedShopping != null) {
      favoritesList = storedShopping!
          .map((e) => Products.fromJson(e))
          .toList()
          .obs;
    }
  }

  getProducts() async {
    List<Products> products = await ProductServices().getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    }
    finally {
      isLoading(false);
    }
    update();
  }

  //logic favorites products
  void manageFavorite(int productId) async {
    var existingIndex = favoritesList.indexWhere((element) =>
    element.id == productId);
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
    }
    else {
      favoritesList.add(
          productList.firstWhere((element) => element.id == productId,));
      await boxStorage.write("isFavoritesList", favoritesList);
    }
    update();
  }

  bool isFavorite(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  //logic search
  void searchProducts(String searchName) {
    var searchProduct=searchName.toLowerCase();
    searchList.value =
        productList.where((search) {
          var searchTitle=search.title.toLowerCase();
          var searchPrice=search.price.toString().toLowerCase();
          return searchTitle.contains(searchProduct) ||
              searchPrice.contains(searchProduct);
        }).toList()
    ;
  }

  void searchClear(){
    searchTextController.value.clear();
    searchProducts('');
  }


}
