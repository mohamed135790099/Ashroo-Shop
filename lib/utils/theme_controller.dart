import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController{
  final GetStorage boxStorage=GetStorage();
  final key='isDarkMode';

  void saveThemeMode(bool isDark)async{
    await boxStorage.write(key, isDark);
  }
  bool getThemeMode(){
    return  boxStorage.read<bool>(key)??false;
  }
  ThemeMode get themeDataGet=>getThemeMode()?ThemeMode.dark:ThemeMode.light;

   void changeTheme(){
    Get.changeThemeMode(getThemeMode()?ThemeMode.light:ThemeMode.dark);
      saveThemeMode(!getThemeMode());
     //Get.isDarkMode?Get.changeThemeMode(ThemeMode.light):Get.changeThemeMode(ThemeMode.dark);
   }
}