import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:sroo_shop/utils/theme.dart';

import 'package:sroo_shop/views/widget/text_utils.dart';
import '../../../logic/controllers/products_controlller.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rating;
  final String description;
  final controller = Get.find<ProductsController>();

  ClothesInfo(
      {Key? key,
      required this.title,
      required this.productId,
      required this.rating,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.atma(
                      textStyle: TextStyle(
                    overflow: TextOverflow.clip,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ),
              Obx(
                () => Container(
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.grey.withOpacity(0.4)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.manageFavorite(productId);
                    },
                    icon: controller.isFavorite(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                googleFont: GoogleFonts.atma,
                text: "$rating",
                color: Get.isDarkMode ? Colors.black : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none,
              ),
              const SizedBox(
                width: 3,
              ),
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemSize: 20,
                unratedColor: Get.isDarkMode ? Colors.black : Colors.white,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            description,
            textAlign:TextAlign.justify,
            trimLines:3,
            trimMode:TrimMode.Line,
            trimExpandedText:"Show Less",
            lessStyle:TextStyle(
              color:Get.isDarkMode?mainColor:pinkClr,
              fontSize:20,
              fontWeight:FontWeight.bold
            ),
            trimCollapsedText:"Show More",
            moreStyle:TextStyle(
                color:Get.isDarkMode?mainColor:pinkClr,
                fontSize:20,
                fontWeight:FontWeight.bold
            ),
            style:GoogleFonts.atma(textStyle:TextStyle(
                height:1.5,
                fontSize:16,
                color: Get.isDarkMode ? Colors.black : Colors.white,
                fontWeight:FontWeight.bold
            ),
            ),),
        ],
      ),
    );
  }
}
