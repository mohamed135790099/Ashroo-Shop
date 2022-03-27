import 'package:get/get.dart';
import 'package:sroo_shop/logic/controllers/category_controller.dart';
import 'package:sroo_shop/logic/controllers/products_controlller.dart';

import '../controllers/cart_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductsController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }

}