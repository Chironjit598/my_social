import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socials/core/app_routes.dart';
import 'package:socials/utils/app_image/app_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  navigate(){
    Future.delayed(Duration(seconds: 3), (){
      Get.offAllNamed(FirebaseAuth.instance.currentUser==null?AppRoutes.signIn:AppRoutes.home);
    });
  }
  @override
  void initState() {
    navigate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo)
           
          ],
        ),
      ),
    );
  }
}
