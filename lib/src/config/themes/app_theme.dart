import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/src/core/utils/app_colors.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';
import 'package:quotes_app/src/core/utils/app_text_styles.dart';

ThemeData lightTheme() => ThemeData(
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      fontFamily: AppStrings.fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: AppTextStyle.appBarTextStyle,
        iconTheme: IconThemeData(
          color: AppColors.scaffoldBackgroundColor,
          size: 28.w,
        ),
      ),
    );
