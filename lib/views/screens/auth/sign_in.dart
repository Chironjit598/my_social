import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:socials/core/app_routes.dart';
import 'package:socials/utils/app_colors/app_colors.dart';
import 'package:socials/utils/app_string/app_string.dart';
import 'package:socials/views/screens/auth/controller/auth_controller.dart';
import 'package:socials/views/widget/custom_button.dart';
import 'package:socials/views/widget/custom_text.dart';
import 'package:socials/views/widget/custom_text_field.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final key=GlobalKey<FormState>();
  AuthController authController=AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.primaryClr,
        title:CustomText(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            text: AppString.appName),),

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Form(
            key: key,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),


                //=================email section===========================//
                customTextField(
                    authController.signInEmailController,
                    TextInputType.emailAddress,
                    context,
                    "Email",
                    validator: ValidationBuilder().email().maxLength(50).build(),


                    prefixIcon: Icons.email_outlined
                ),

                //=================pass section===========================//

                SizedBox(
                  height: 7.h,
                ),
                customTextField(
                    authController.signInPassController,
                    TextInputType.emailAddress,
                    context,
                    "Password",
                    validator: ValidationBuilder().maxLength(15).minLength(6).build(),

                    prefixIcon: Icons.email_outlined
                ),

                SizedBox(
                  height: 20.h,
                ),

                //======================sign Up Button================

                CustomButton(
                    title: "Sign In",
                    ontap: (){

                        authController.signIn();







                    }
                ),

                SizedBox(
                  height: 50.h,
                ),




                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don\'t have an account?",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.blackClr,
                      ),
                    ),
                    TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.signUp),
                        child: Text("Sign Up",
                            style: TextStyle(
                              color: AppColors.primaryClr,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ))),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
