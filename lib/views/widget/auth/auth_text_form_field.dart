import 'package:flutter/material.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final Function validator;
  final Widget prefix;
  final Widget suffix;
  final String hintText;



  const AuthTextFromField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.prefix,
    required this.suffix,
    required this.obscureText,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor:Colors.grey.shade200,
        hintText:hintText,
        hintStyle:const TextStyle(fontSize:16,fontWeight:FontWeight.w500,color:Colors.black45),
        filled:true,
        enabledBorder: OutlineInputBorder(
            borderSide:const BorderSide(
               color:Colors.white,
              ),
          borderRadius:BorderRadius.circular(10),
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(
            color:Colors.white,
          ),
          borderRadius:BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:const BorderSide(
            color:Colors.white,
          ),
          borderRadius:BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:const BorderSide(
            color:Colors.white,
          ),
          borderRadius:BorderRadius.circular(10),
        ),
      ),
   style: const TextStyle(color:Colors.black) ,
    );
  }
}
