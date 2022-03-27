import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sroo_shop/models/product_models.dart';
import 'package:sroo_shop/routes/routs.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../utils/theme.dart';
import 'image_picker.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;


  const ImageSliders({Key? key, required this.imageUrl,}) : super(key: key);

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();
  final cartController=Get.find<CartController>();
  int currentIndex = 0;
  int currentColor = 0;
  List<Color> selectColor = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor2,
    kCOlor1,
    kCOlor3,
    kCOlor5,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.imageUrl),
                  )),
            );
          },
          options: CarouselOptions(
              height: 400,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 300),
              autoPlayInterval: const Duration(seconds: 1),
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
        ),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              count: 3,
              activeIndex: currentIndex,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Get.isDarkMode ? mainColor : pinkClr,
                  dotColor: Colors.black),
            )),
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 200,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.3),
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: ImagePicker(
                        color: selectColor[index],
                        outerBorder: currentColor == index,
                      ));
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 3,
                ),
                itemCount: selectColor.length,
              ),
            )),
        Positioned(
          top: 20,
          left: 25,
          right: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap:(){Get.back();},
                child: Container(
                  padding:const EdgeInsets.all(8),
                  width:50,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode ? mainColor.withOpacity(0.8) : pinkClr.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child:Padding(
                    padding: const EdgeInsets.only(left:10),
                    child: Icon(
                        Icons.arrow_back_ios,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        size: 25,
                      ),
                  ),
                  ),
              ),
              Obx(()=>Badge(
                 position: BadgePosition.topEnd(top: -10, end: -10),
                 animationDuration: const Duration(milliseconds: 300),
                 animationType: BadgeAnimationType.slide,
                 badgeContent: Text(cartController.quantity().toString(),
                 style:const TextStyle(color: Colors.white),
                ),
              child: InkWell(
                onTap:(){
                  Get.offNamed(Routes.cartScreen);
                },
                child: Container(
                  padding:const EdgeInsets.all(8),
                  width:50,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode ? mainColor.withOpacity(0.8): pinkClr.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child:Icon(
                    Icons.shopping_cart,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    size: 25,
                  ),
                ),
              ),),),

            ],
          ),
        ),
      ],
    );
  }
}
