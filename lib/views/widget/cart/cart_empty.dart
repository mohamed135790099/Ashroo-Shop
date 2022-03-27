
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sroo_shop/routes/routs.dart';
import 'package:sroo_shop/utils/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
         Icon(Icons.shopping_cart,color:Get.isDarkMode?Colors.black:Colors.white,size:200,),
          const SizedBox(height:50,),
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text:"Your Cart is ",
                style:TextStyle(
                  color:Get.isDarkMode?Colors.black:Colors.white,
                  fontSize:30,
                  fontWeight:FontWeight.bold
                )
              ),
              TextSpan(
                  text:"Empty",
                  style:TextStyle(
                      color:Get.isDarkMode?mainColor:pinkClr,
                      fontSize:30,
                      fontWeight:FontWeight.bold
                  )
              ),
            ],
          )),
          const SizedBox(height:15,),
          Text("Add items to get Started",
              style:TextStyle(
              color:Get.isDarkMode?Colors.black:Colors.white,
              fontSize:15,
              fontWeight:FontWeight.bold
          )),
          const SizedBox(height:50,),
          ElevatedButton(onPressed: (){
            Get.offNamed(Routes.mainScreen);
          },
              style: ElevatedButton.styleFrom(
                  fixedSize:const Size(160, 50) ,
                  maximumSize:const Size(200, 75) ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                elevation: 0,
                primary: Get.isDarkMode ? mainColor : pinkClr,
              ), // RoundedRectangleBorder
            child: Text(
              " GO TO Home",
              style:TextStyle(
                  color:Get.isDarkMode?Colors.black:Colors.white,
                  fontSize:20,
                  fontWeight:FontWeight.bold
              )),),

        ],
      ),
    );
  }
}
