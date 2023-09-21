import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/locator.dart';
import 'package:quotes_app/src/config/locale/app_localizations_setup.dart';
import 'package:quotes_app/src/config/routes/app_routes.dart';
import 'package:quotes_app/src/config/themes/app_theme.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';

import 'package:quotes_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_app/src/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:reusable_components/reusable_components.dart';

class QuotifyApp extends StatelessWidget {
  const QuotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                serviceLocator.get<RandomQuoteCubit>()..getRandomQuote(),
          ),
          BlocProvider(
            create: (context) =>
                serviceLocator.get<LocaleCubit>()..getSavedLang(),
          ),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appTitle,
              theme: lightTheme(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
              locale: state.locale,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
            );
          },
        ),
      ),
    );
  }
}
