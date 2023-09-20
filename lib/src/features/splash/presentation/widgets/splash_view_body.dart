import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/src/core/utils/app_assets.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            AppAssets.appIcon,
            fit: BoxFit.cover,
            height: 100.w,
            width: 100.w,
          ),
        ),
        Text(
          AppStrings.appTitle,
          style: TextStyle(
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                color: Colors.black.withOpacity(0.19),
                offset: const Offset(2, 5),
              )
            ],
            fontSize: 55.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
