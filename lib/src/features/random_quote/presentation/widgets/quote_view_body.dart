import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes_app/src/core/widgets/custom_error_widget.dart';
import 'package:quotes_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '/src/features/random_quote/presentation/widgets/quote.dart';
import '/src/features/random_quote/presentation/widgets/refresh_icon_button.dart';

class QuoteViewBody extends StatelessWidget {
  const QuoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteIsLoading) {
          return SpinKitFadingCircle(
            color: AppColors.primaryColor,
          );
        } else if (state is RandomQuoteLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Quote(quote: state.quote),
              const RefreshIconButton(),
            ],
          );
        } else if (state is RandomQuoteError) {
          return CustomErrorWidget(
            onPressed: () {
              BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
            },
          );
        } else {
          return CustomErrorWidget(
            onPressed: () {
              BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
            },
          );
        }
      },
    );
  }
}
