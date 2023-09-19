import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/src/core/errors/failure.dart';
import 'package:quotes_app/src/core/usecases/usecases.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';
import 'package:quotes_app/src/features/random_quote/domain/usecases/get_random_quote.dart';

import '../../domain/entities/quote_entity.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, QuoteEntity> response =
        await getRandomQuoteUseCase(NoParams());

    emit(
      response.fold(
        (failure) => RandomQuoteError(error: _mapFailureToMsg(failure)),
        (quote) => RandomQuoteLoaded(quote: quote),
      ),
    );
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;

      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedFailure;
    }
  }
}
