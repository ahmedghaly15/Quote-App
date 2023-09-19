import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';

class RefreshIconButton extends StatelessWidget {
  const RefreshIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      splashColor: AppColors.primaryColor.withOpacity(0.3),
      margin: EdgeInsets.only(top: 15.h),
      backgroundColor: AppColors.primaryColor,
      shape: BoxShape.circle,
      icon: Icons.refresh,
      onTap: () => BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote(),
      iconColor: Colors.white,
      iconSize: 28.w,
    );
  }
}
