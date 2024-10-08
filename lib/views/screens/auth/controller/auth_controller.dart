import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socials/core/app_routes.dart';

class AuthController extends GetxController{

  //===================sign up=================
  final emailControllere=TextEditingController();
  final passController=TextEditingController();
  final nameConroller=TextEditingController();


  //===================sign In=================
  final signInEmailController=TextEditingController();
  final signInPassController=TextEditingController();

  //======================sign Up================================

  void signUp()async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControllere.text,
        password: passController.text,
      );
      if(credential.user!=null){
        var data={
          "userName":nameConroller.text,
          "email":emailControllere.text,
          "created_at":DateTime.now(),
        };
        await FirebaseFirestore.instance.
        collection("users")
            .doc(credential.user!.uid)
            .set(data);
      }

      print("=====================Sign Up Clicked");

      Get.offAllNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //===================sign In===============================

void signIn()async{

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInEmailController.text,
        password: signInPassController.text
    );





    Get.offAllNamed(AppRoutes.home);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('===========================>No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('===========================>Wrong password provided for that user.');
    }
  }

}



}