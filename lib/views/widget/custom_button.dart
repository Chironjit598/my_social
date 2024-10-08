import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socials/main.dart';
import 'package:socials/utils/app_colors/app_colors.dart';
import 'package:socials/views/widget/custom_text.dart';

Widget CustomButton({title, ontap}){
  return InkWell(
    onTap: ontap,
      child: Container(

        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.primaryClr,
          borderRadius: BorderRadius.circular(20.r)

        ),
        child: Center(
            child: CustomText(
                text:title,
            fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            )),
      ));

}