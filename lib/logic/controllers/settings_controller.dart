import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_string.dart';

class SettingsController extends GetxController{
   RxBool changeSwitch=false.obs;
   var storage=GetStorage();
   var langLocal=ene;
   String capitalize(String profileName){
      return profileName.split(" ").map((name) => name.capitalize).join(" ");
   }

   //language
   @override
     void onInit()async{
      langLocal =await getLanguage;
       super.onInit();
     }
   // void save language
   void saveLanguage(String lang)async{
      await storage.write("lang", lang);
   }
   // get language
   Future<String> get getLanguage async{
     return await storage.read("lang");
   }
   void changeLanguage(String typeLang){
         saveLanguage(typeLang);
      if(langLocal==typeLang){
         return;
      }
      else if(typeLang==frf){
         saveLanguage(frf);
      }
      else if(typeLang==ara){
         saveLanguage(ara);
      }
      else{
         saveLanguage(ene);
      }
      update();
   }

}