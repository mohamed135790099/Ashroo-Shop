import 'package:get/get.dart';
import 'package:sroo_shop/models/product_models.dart';

import '../../services/category_services.dart';

class CategoryController extends GetxController{
  @override
  void onInit() async {
    super.onInit();
    getCategory();
  }

  var isLoading=false.obs;
  var isCategoryLoading=false.obs;

  var categoryNameList=<String>[].obs;
  var categoryList=<Products>[].obs;

  void getCategory()async{
    var category=await CategoryServices().getCategory();
    if(category.isNotEmpty){
      try{
        isLoading=true.obs;
        categoryNameList.addAll(category);
      }finally{
        isLoading=false.obs;
      }
    }
    update();
  }

   getALLCategory(String newCategory)async{

        isCategoryLoading(true);
        categoryList.value=await AllCategoryServices().getAllCategory(newCategory);
        isCategoryLoading(false);

  }


  getCategoryIndex(int index) async {
    var categoryAllName = await getALLCategory(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }

  List<String> imageCategory=[
  "https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg",
  "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
  "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
  "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
 ].obs;

}