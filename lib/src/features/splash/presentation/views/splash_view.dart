import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotes_app/src/config/routes/app_routes.dart';
import 'package:quotes_app/src/core/utils/app_colors.dart';
import 'package:quotes_app/src/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  _goToNext() => Navigator.pushReplacementNamed(context, Routes.randomQuote);

  _startDelay() {
    _timer = Timer(
      const Duration(
        seconds: 2,
      ),
      () => _goToNext(),
    );
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: const SplashViewBody(),
    );
  }
}
