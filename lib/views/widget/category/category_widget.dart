import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sroo_shop/logic/controllers/category_controller.dart';
import 'package:sroo_shop/views/widget/category/category_item.dart';

class CategoryWidget extends StatelessWidget {
  var controller=Get.find<CategoryController>();
  CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //controller.getALLCategory(controller.categoryNameList[index]);
              controller.getCategoryIndex(index);
              Get.to(() => CategoryItem(controller.categoryNameList[index]));
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.grey,
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(controller.imageCategory[index]),
                ),
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(controller.categoryNameList[index], style: const TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black45,
                    fontSize: 25,),),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10,),
        itemCount:controller.categoryNameList.length,
      ),
    );
  }
}
