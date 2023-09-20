import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quotes_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_app/src/features/random_quote/presentation/widgets/quote.dart';

import '../../../../../locator.dart';
import '../../domain/entities/quote_entity.dart';

class FavQuotesViewBody extends StatelessWidget {
  const FavQuotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) =>
              Quote(quote: serviceLocator.get<List<QuoteEntity>>()[index]),
          separatorBuilder: (context, index) => SizedBox(height: 15.h),
          itemCount: serviceLocator.get<List<QuoteEntity>>().length,
        );
      },
    );
  }
}
