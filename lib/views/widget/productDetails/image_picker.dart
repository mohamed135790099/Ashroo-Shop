import 'package:flutter/material.dart';
class ImagePicker extends StatelessWidget {
  final Color color;
  final bool outerBorder;
  const ImagePicker({Key? key,required this.color, required this.outerBorder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(3),
      decoration:BoxDecoration(
        shape:BoxShape.circle,
        border:outerBorder?Border.all(width:3,color:color):null,
      ),
      child:Container(
        padding:const EdgeInsets.all(15),
        decoration:BoxDecoration(
          color:color,
          shape:BoxShape.circle,
        ),
      ),
    );
  }
}
