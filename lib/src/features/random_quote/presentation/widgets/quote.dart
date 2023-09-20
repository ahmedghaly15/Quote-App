import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/src/features/random_quote/domain/entities/quote_entity.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'bookmark_icon.dart';
import 'frame_circle.dart';

class Quote extends StatelessWidget {
  const Quote({super.key, required this.quote});
  final QuoteEntity quote;

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
            quote.content,
            style: AppTextStyle.quoteTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          Row(
            children: <Widget>[
              const FrameCircle(),
              SizedBox(width: 4.w),
              Text(
                quote.author,
                style: AppTextStyle.quoteTextStyle,
              ),
              SizedBox(width: 4.w),
              const FrameCircle(),
              const Expanded(child: SizedBox()),
              BookmarkIcon(quote: quote),
            ],
          ),
        ],
      ),
    );
  }
}
