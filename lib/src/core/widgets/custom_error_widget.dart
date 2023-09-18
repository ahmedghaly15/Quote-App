import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/src/core/utils/app_colors.dart';
import 'package:quotes_app/src/core/utils/app_text_styles.dart';
import 'package:reusable_components/reusable_components.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Icon(
              Icons.warning,
              color: AppColors.primaryColor,
              size: 150.w,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              'Something went wrong',
              style: AppTextStyle.titleErrorTextStyle,
            ),
          ),
          Text(
            'Please try again later',
            style: AppTextStyle.subTitleErrorTextStyle,
          ),
          SizedBox(height: 15.h),
          MyCustomButton(
            height: 50.h,
            width: SizeConfig.screenWidth! * 0.55,
            backgroundColor: AppColors.primaryColor,
            elevation: 500.w,
            onPressed: () {
              if (onPressed != null) onPressed!();
            },
            hasPrefix: false,
            child: Center(
              child: Text(
                'Reload Screen',
                style: AppTextStyle.buttonErrorTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
