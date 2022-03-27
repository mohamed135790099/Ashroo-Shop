import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:sroo_shop/routes/routs.dart';
import 'package:sroo_shop/utils/theme.dart';

import '../../models/facebook_model.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  FaceBookModel? faceBookModel;

  User? get userProfiloe => auth.currentUser;

  bool invisible = true;
  bool isCheck = false;
  RxString displayUserName = ''.obs;
  RxString displayUserPhoto = ''.obs;
  RxString displayUserEmail = ''.obs;

  bool signIn = false;
  GetStorage boxStorage = GetStorage();

  @override
  void onInit() {
     googleSignIn;
    super.onInit();
  }

  void invisibility() {
    invisible = !invisible;
    update();
  }

  void checkBox() {
    isCheck = !isCheck;
    update();
  }

  void singUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);

      signIn = true;
      boxStorage.write("auth", signIn);
      update();
      Get.offNamed(AppRoutes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String message = 'error Occurred';
      String title = e.code;
      if (title == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (title == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title.replaceAll(RegExp('-'), ' ').capitalize!, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: darkGreyClr,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void singInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);
      signIn = true;
      boxStorage.write("auth", signIn);
      update();
      Get.offNamed(AppRoutes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String message = 'error Occurred';
      String title = e.code;
      if (title == 'user-not-found') {
        message = 'No user found for that $email.';
      } else if (title == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title.replaceAll(RegExp('-'), ' ').capitalize!, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: darkGreyClr,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

/*
  void singInUsingGoogle() async{
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName=googleUser!.displayName!;
      displayUserPhoto=googleUser.photoUrl!;

      update();
      Get.offNamed(AppRoutes.mainScreen);


    }catch(e){
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }


  }
*/
  Future<void> singInUsingGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    update();
    if (googleUser != null) {
      try {
        final GoogleSignInAuthentication? googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);

        displayUserName.value = googleUser.displayName!;
        displayUserPhoto.value = googleUser.photoUrl!;
        displayUserEmail.value = googleUser.email;

        signIn = true;
        boxStorage.write("auth", signIn);
        Get.offNamed(AppRoutes.mainScreen);
      } catch (e) {
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

  Future<void> singInUsingFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      signIn = true;
      boxStorage.write("auth", signIn);
      update();
      Get.offNamed(AppRoutes.mainScreen);
    }
  }

  void restPasswordUsingFirebase(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String message = 'error Occurred';
      String title = e.code;
      if (title == 'user-not-found') {
        message = 'No user found for that $email.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title.replaceAll(RegExp('-'), ' ').capitalize!, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: darkGreyClr,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future<void> signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';
      signIn = false;
      boxStorage.remove("auth");
      Get.offNamed(AppRoutes.initialRoute);
      update();
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
