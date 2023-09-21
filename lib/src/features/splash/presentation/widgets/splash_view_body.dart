import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/src/config/locale/app_localizations.dart';
import 'package:quotes_app/src/core/utils/app_assets.dart';
import 'package:quotes_app/src/core/utils/app_text_styles.dart';

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
          AppLocalizations.of(context)!.translate('splash_title')!,
          style: AppTextStyle.splashTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
