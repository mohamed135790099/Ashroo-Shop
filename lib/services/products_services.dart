import 'package:http/http.dart' as http;

import '../models/product_models.dart';
class ProductServices{
  Future<List<Products>> getProduct() async {
   var response= await http.get(Uri.parse('https://fakestoreapi.com/products'));
   if(response.statusCode==200){
     return productsFromJson(response.body);
   }
   else{
     return  throw Exception ("Failed to load product");
   }

  }
}