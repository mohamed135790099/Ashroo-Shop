import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

import '../widget/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    googleFont: GoogleFonts.asar,
                    text: "Category",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.none,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                  const SizedBox(height:10,),
                  CategoryWidget(),
                ],
              ),
        ),
        ),
    );
  }
}
