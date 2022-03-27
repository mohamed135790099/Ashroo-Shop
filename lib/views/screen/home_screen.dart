import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

import '../../utils/theme.dart';
import '../widget/home/grid_view_item.dart';
import '../widget/home/search_text_from.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
         backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? mainColor : pinkClr,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        TextUtils(
                            googleFont: GoogleFonts.amarante,
                            text: "Find Your",
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.none),
                        const SizedBox(
                          height: 5,
                        ),
                        TextUtils(
                            googleFont: GoogleFonts.amarante,
                            text: "INSPIRATION",
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.none),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                SearchTextFrom(),
                               const  SizedBox(
                                  width: 10,
                                ),
                               const Icon(Icons.sort, size: 25, color: Colors.white),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      TextUtils(
                          googleFont: GoogleFonts.arapey,
                          text: "Categories",
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          textDecoration: TextDecoration.none),
                    ],
                  ),
                ),
              ],
          ),
          GridViewItem(),
        ],
      ),
    ));
  }
}
