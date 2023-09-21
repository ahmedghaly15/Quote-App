import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/src/core/utils/app_colors.dart';

class AppTextStyle {
  static TextStyle splashTextStyle = TextStyle(
    color: Colors.white,
    shadows: <Shadow>[
      Shadow(
        color: Colors.black.withOpacity(0.19),
        offset: const Offset(2, 5),
      )
    ],
    fontSize: 55.sp,
    fontWeight: FontWeight.w900,
  );

  static TextStyle quoteTextStyle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.scaffoldBackgroundColor,
    height: 1.3.h,
  );

  static TextStyle appBarTextStyle = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.scaffoldBackgroundColor,
  );

  static TextStyle titleErrorTextStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );
  static TextStyle buttonErrorTextStyle = TextStyle(
    fontSize: 20.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subTitleErrorTextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.hintColor,
  );
}
