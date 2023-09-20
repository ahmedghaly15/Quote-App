import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/locator.dart';

import 'package:quotes_app/src/features/random_quote/domain/entities/quote_entity.dart';
import 'package:quotes_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';

class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon({
    super.key,
    required this.quote,
  });

  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (serviceLocator
            .get<List<QuoteEntity>>()
            .any((element) => element == quote)) {
          Future.delayed(const Duration(milliseconds: 700), () {
            BlocProvider.of<RandomQuoteCubit>(context)
                .removeFromFav(quote: quote);

            BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
          });
        } else {
          Future.delayed(const Duration(milliseconds: 700), () {
            BlocProvider.of<RandomQuoteCubit>(context).addToFav(quote: quote);
            BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
          });
        }
      },
      child: Icon(
        serviceLocator
                .get<List<QuoteEntity>>()
                .any((element) => element == quote)
            ? Icons.bookmark
            : Icons.bookmark_border,
        color: Colors.white,
        size: 28.w,
      ),
    );
  }
}
