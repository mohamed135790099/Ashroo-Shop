import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/routes/routs.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/auth/auth_text_form_field.dart';

import '../../../logic/controllers/auth_getx_controller.dart';
import '../../../utils/my_string.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_container_under.dart';
import '../../widget/auth/check_widget.dart';
import '../../widget/text_utils.dart';

class SignUp extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey=GlobalKey<FormState>();

  final controller=Get.find<AuthController>();


   SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         appBar: AppBar(
         backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
         elevation: 0,
         ),
         backgroundColor: context.theme.backgroundColor,
     body: Column(
       children: [
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 SizedBox(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height / 1.3,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                     child: SingleChildScrollView(
                       child: Form(
                         key:formKey,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             Row(
                               children: [
                                 TextUtils(
                                     googleFont: GoogleFonts.alata,
                                     text: 'SIGN',
                                     color: Get.isDarkMode ? mainColor : pinkClr,
                                     fontSize: 28,
                                     fontWeight: FontWeight.bold,
                                     textDecoration: TextDecoration.none),
                                 const SizedBox(
                                   width: 3,
                                 ),
                                 TextUtils(
                                     googleFont: GoogleFonts.alata,
                                     text: 'UP',
                                     color: Get.isDarkMode ? Colors.black : Colors.white,
                                     fontSize: 28,
                                     fontWeight: FontWeight.bold,
                                     textDecoration: TextDecoration.none),
                               ],
                             ),
                             const SizedBox(
                               height: 50,
                             ),
                             AuthTextFromField(
                               controller: nameController,
                               textInputType: TextInputType.name,
                               prefix: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: CircleAvatar(
                                     backgroundColor: Colors.white,
                                     child: Get.isDarkMode
                                         ? Image.asset('assets/images/user.png')
                                         : const Icon(
                                       Icons.person,
                                       size: 30,
                                       color: pinkClr,
                                     )),
                               ),
                               suffix: const Text(""),
                               obscureText: false,
                               hintText: 'User Name',
                               validator: (value) {
                                 if(!RegExp(validationName).hasMatch(value)||value.toString().length<4){
                                   return 'Enter valid name';
                                 }
                                 else{
                                   return null;
                                 }
                               },
                             ),
                             const SizedBox(
                               height: 20,
                             ),
                             AuthTextFromField(
                               controller: emailController,
                               textInputType: TextInputType.emailAddress,
                               prefix: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: CircleAvatar(
                                     backgroundColor: Colors.white,
                                     child: Get.isDarkMode
                                         ? Image.asset('assets/images/email.png')
                                         : const Icon(
                                       Icons.email,
                                       size: 30,
                                       color: pinkClr,
                                     )),
                               ),
                               suffix: const Text(""),
                               obscureText: false,
                               hintText: 'Email',
                               validator: (value) {
                                 if(!RegExp(validationEmail).hasMatch(value)){
                                   return 'Enter valid Email';
                                 }
                                 else{
                                   return null;
                                 }
                               },
                             ),
                             const SizedBox(
                               height: 20,
                             ),
                             GetBuilder<AuthController>(
                               builder:(_)=>AuthTextFromField(
                                 controller: passwordController,
                                 textInputType: TextInputType.visiblePassword,
                                 prefix: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: CircleAvatar(
                                       backgroundColor: Colors.white,
                                       child: Get.isDarkMode
                                           ? Image.asset('assets/images/lock.png')
                                           : const Icon(
                                         Icons.lock,
                                         size: 30,
                                         color: pinkClr,
                                       )),
                                 ),
                                 suffix:IconButton(icon:controller.invisible?const Icon(Icons.visibility_off,color:Colors.black,):const Icon(Icons.visibility,color:Colors.black,),onPressed:(){
                                   controller.invisibility();
                                 },),
                                 obscureText:controller.invisible,
                                 hintText: 'Password',
                                 validator: (value) {
                                   if(value.toString().length<5){
                                     return 'Enter valid password';
                                   }
                                   else{
                                     return null;
                                   }
                                 },
                               ),

                             ),
                             const SizedBox(
                               height: 20,
                             ),
                             CheckWidget(),
                             const SizedBox(
                               height: 70,
                             ),
                             Center(
                               child: AuthButton(
                                 text: 'SIGNUP',
                                 onPressed: () {
                                   if(controller.isCheck==false){
                                     Get.snackbar('Check Box', 'Please Accept terms & conditions ',snackPosition:SnackPosition.BOTTOM,backgroundColor:darkGreyClr,colorText:Colors.white);
                                   }
                                   else if(controller.isCheck==true){
                                     final invalid = formKey.currentState!.validate();
                                     FocusScope.of(context).unfocus();
                                     if(invalid){
                                       formKey.currentState!.save();
                                       controller.singUpUsingFirebase(name: nameController.text.trim(), email:emailController.text.trim(), password:passwordController.text);
                                     }

                                   }

                                 },
                               ),
                             ),
                             const SizedBox(
                               height: 70,
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
                 BottomAppBar(
                   elevation:0,
                   color:Get.isDarkMode?Colors.white:darkGreyClr,
                   child: Container(
                     padding:const EdgeInsets.only(bottom:20),
                     width: double.maxFinite,
                     decoration:BoxDecoration(
                       color: Get.isDarkMode?mainColor:pinkClr,
                       borderRadius: const BorderRadius.only(
                         topLeft: Radius.circular(20),
                         topRight: Radius.circular(20),
                       ),),
                     child: Column(
                       mainAxisSize: MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                         ContainerUnder(
                           text: 'Already have an account?',
                           onPressed: () {
                             Get.offNamed(Routes.loginScreen);
                           },
                           textType: 'Login',
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
    ));
  }
}
