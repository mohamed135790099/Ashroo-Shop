import 'package:get/get.dart';
import 'package:sroo_shop/logic/bindings/auth_binding.dart';
import 'package:sroo_shop/logic/bindings/main_binding.dart';
import 'package:sroo_shop/views/screen/auth/forget_password_screen.dart';
import 'package:sroo_shop/views/screen/auth/login_screen.dart';
import 'package:sroo_shop/views/screen/auth/signup_screen.dart';
import 'package:sroo_shop/views/screen/cart_screen.dart';
import 'package:sroo_shop/views/screen/main_screen.dart';
import 'package:sroo_shop/views/screen/welcome_screen.dart';

import '../logic/bindings/product_binding.dart';
import '../views/widget/category/category_item.dart';

class AppRoutes {
  static const String initialRoute = Routes.welcomeScreen;
  static const String signUpRoute = Routes.singUpScreen;
  static const String loginRoute = Routes.loginScreen;
  static const String mainScreen = Routes.mainScreen;

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.singUpScreen,
        page: () => SignUp(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.loginScreen, page: () => Login(), binding: AuthBinding()),
    GetPage(
        name: Routes.forgetPasswordScreen,
        page: () => ForgetPassword(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.mainScreen,
        page: () => const MainScreen(),
        bindings: [AuthBinding(), MainBinding(), ProductBinding()]),
    GetPage(
        name: Routes.cartScreen,
        page: () =>  CartScreen(),
        bindings: [
          AuthBinding(),
          ProductBinding(),
        ]),



  ];
}

class Routes {
  static const String welcomeScreen = '/Welcome_Screen';
  static const String loginScreen = '/login_Screen';
  static const String singUpScreen = '/singUp_Screen';
  static const String forgetPasswordScreen = '/forget_password_Screen';
  static const String mainScreen = '/main_Screen';
  static const String categoryScreen = '/category_Screen';
  static const String favoritesScreen = '/favorites_Screen';
  static const String homeScreen = '/home_Screen';
  static const String cartScreen = '/cart_Screen';


}
