import 'package:http/http.dart'as http;

import '../models/category_model.dart';
import '../models/product_models.dart';
class CategoryServices{
  Future<List<String>> getCategory() async {
    var response= await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if(response.statusCode==200){
      return categoryModelFromJson(response.body);
    }
    else{
      return  throw Exception ("Failed to load product");
    }
  }

}
class AllCategoryServices{
  Future<List<Products>> getAllCategory(String product) async {
    var response= await http.get(Uri.parse('https://fakestoreapi.com/products/category/$product'));
    if(response.statusCode==200){
      return productsFromJson(response.body);
    }
    else{
      return  throw Exception ("Failed to load product");
    }

  }
}