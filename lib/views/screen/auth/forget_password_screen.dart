import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sroo_shop/logic/controllers/auth_getx_controller.dart';
import 'package:sroo_shop/routes/routs.dart';

import 'package:sroo_shop/utils/theme.dart';
import 'package:sroo_shop/views/widget/auth/auth_button.dart';
import 'package:sroo_shop/views/widget/text_utils.dart';

import '../../../utils/my_string.dart';
import '../../widget/auth/auth_text_form_field.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Get.isDarkMode ?Colors.white:darkGreyClr,
          title: Text(
            'Forget Password',
            style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'if you want to recover your account then please provide your email ID blew...',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  height: 280,
                ),
                Form(
                  key: formKey,
                  child: AuthTextFromField(
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
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(
                  builder: (_) => AuthButton(
                    onPressed: () {
                      controller.restPasswordUsingFirebase(
                          emailController.text.trim());
                    },
                    text: 'Send',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
