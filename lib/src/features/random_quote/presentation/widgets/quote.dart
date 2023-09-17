import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'bookmark_icon.dart';
import 'frame_circle.dart';

class Quote extends StatelessWidget {
  const Quote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      margin: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'commodo occaecat mollit est ex aliquip sit laboris. Ea cillum cillum aliqua pariatur aliquip minim mollit cillum minim ad ad eiusmod et. Id eu consequat dolor ipsum.',
            style: AppTextStyle.quoteTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.screenWidth! * 0.26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FrameCircle(),
                    SizedBox(width: 4.w),
                    Text(
                      'Bill Gates',
                      style: AppTextStyle.quoteTextStyle,
                    ),
                    SizedBox(width: 4.w),
                    const FrameCircle(),
                  ],
                ),
                const BookmarkIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
