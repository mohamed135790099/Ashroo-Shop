import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/routes/routs.dart';
import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/auth/auth_text_form_field.dart';

import '../../../logic/controllers/auth_getx_controller.dart';
import '../../../utils/my_string.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_container_under.dart';
import '../../widget/text_utils.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

   Login({Key? key}) : super(key: key);

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
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  TextUtils(
                                      googleFont: GoogleFonts.alata,
                                      text: 'LOG',
                                      color: Get.isDarkMode ? mainColor : pinkClr,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      textDecoration: TextDecoration.none),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  TextUtils(
                                      googleFont: GoogleFonts.alata,
                                      text: 'IN',
                                      color: Get.isDarkMode
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      textDecoration: TextDecoration.none),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
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
                                  if (!RegExp(validationEmail).hasMatch(value)) {
                                    return 'Enter valid Email';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GetBuilder<AuthController>(
                                builder: (_) => AuthTextFromField(
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
                                  suffix: IconButton(
                                    icon: controller.invisible
                                        ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                        : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      controller.invisibility();
                                    },
                                  ),
                                  obscureText: controller.invisible,
                                  hintText: 'Password',
                                  validator: (value) {
                                    if (value.toString().length < 5) {
                                      return 'Enter valid password';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.forgetPasswordScreen);
                                },
                                child: TextUtils(
                                    googleFont: GoogleFonts.amarante,
                                    text: 'Forget Password?',
                                    color:
                                    Get.isDarkMode ? Colors.black : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    textDecoration: TextDecoration.none),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: AuthButton(
                                  text: 'LOGIN',
                                  onPressed: () {
                                    final invalid = formKey.currentState!.validate();
                                    FocusScope.of(context).unfocus();
                                    if (invalid) {
                                      formKey.currentState!.save();
                                      controller.singInUsingFirebase(
                                          email: emailController.text.trim(),
                                          password: passwordController.text);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                  child: TextUtils(
                                      googleFont: GoogleFonts.amarante,
                                      text: 'OR',
                                      color: Get.isDarkMode
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      textDecoration: TextDecoration.none)),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        controller.singInUsingFacebook();
                                      },
                                      child:
                                      Image.asset('assets/images/facebook.png')),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  GetBuilder<AuthController>(
                                    builder:(_)=>TextButton(
                                        onPressed: () {
                                          controller.singInUsingGoogle()
                                          ;
                                        },
                                        child: Image.asset('assets/images/google.png')),
                                  ),
                                ],
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
                ],
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
                    text: "Don't have any account?",
                    onPressed: () {
                      Get.offNamed(Routes.singUpScreen);
                    },
                    textType: 'SingUp',
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
