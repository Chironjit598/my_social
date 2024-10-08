import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:socials/core/app_routes.dart';
import 'package:socials/utils/app_colors/app_colors.dart';
import 'package:socials/views/widget/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryClr,
        title: CustomText(text: "Home"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Get.offAllNamed(AppRoutes.signIn);
              },

              title: CustomText(
                  text: "Sign Out",
              textAlign: TextAlign.left,
              color: AppColors.blackClr,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,


              ),
            )
          ],
        ),
      ),
    );
  }
}
