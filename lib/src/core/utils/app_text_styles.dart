import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/src/core/utils/app_colors.dart';

class AppTextStyle {
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
}
