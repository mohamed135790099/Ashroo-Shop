import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/utils/theme.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ['S', 'M', 'L', 'X', 'XXL'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width:2,color:currentIndex==index?Colors.amber:Get.isDarkMode?mainColor:pinkClr),
                    color: Get.isDarkMode?currentIndex == index
                        ? Colors.white
                        : mainColor.withOpacity(0.4):currentIndex==index?Colors.grey.withOpacity(0.4):pinkClr.withOpacity(0.7)),
                child: Text(
                  sizeList[index].toString(),
                  style: GoogleFonts.aclonica(textStyle:TextStyle(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ), )
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: sizeList.length,
        ),
    );
  }
}
