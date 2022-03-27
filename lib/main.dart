import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sroo_shop/languaage/localiztion.dart';
import 'package:sroo_shop/logic/provider/main_provider.dart';
import 'package:sroo_shop/routes/routs.dart';
import 'package:provider/provider.dart';
import 'package:sroo_shop/utils/my_string.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/utils/theme_controller.dart';


void main()async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainProvider()),
    ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode:ThemeController().themeDataGet,
      locale:Locale(GetStorage().read<String>("lang").toString()),
      fallbackLocale:Locale(ene),
      translations:LocaliztionApp(),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      initialRoute:FirebaseAuth.instance.currentUser!=null||GetStorage().read("auth")==true?AppRoutes.mainScreen:AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner:false,
    );
  }
}

