import 'package:get/get.dart';
import 'package:sroo_shop/views/screen/cart_screen.dart';
import 'package:sroo_shop/views/screen/category_screen.dart';
import 'package:sroo_shop/views/screen/favorites_screen.dart';
import 'package:sroo_shop/views/screen/home_screen.dart';
import 'package:sroo_shop/views/screen/settings_screen.dart';

class MainController extends GetxController{

final List<Map<String, Object>> tabs = [
  {
    'page': const HomeScreen(),
    'title': 'asroo shop',
  },
  {
    'page': const CategoryScreen(),
    'title': 'Category ',
  },
  {
    'page':  FavoritesScreen(),
    'title': 'Favorite ',
  },
  {
    'page': SettingsScreen(),
    'title': 'Settings',
  },
  {
    'page':  CartScreen(),
    'title': 'CartItem',
  },
];


}