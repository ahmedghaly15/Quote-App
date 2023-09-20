import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/src/core/errors/failure.dart';
import 'package:quotes_app/src/core/usecases/usecases.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';
import 'package:quotes_app/src/features/random_quote/domain/usecases/get_random_quote.dart';

import '../../domain/entities/quote_entity.dart';
import '../../domain/repositories/fav_repo.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  final FavRepo favRepo;

  RandomQuoteCubit({
    required this.getRandomQuoteUseCase,
    required this.favRepo,
  }) : super(RandomQuoteInitial());

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

  void addToFav({required QuoteEntity quote}) {
    favRepo.addToFav(quote: quote);
    emit(AddedToFavorite(quote: quote));
  }

  void removeFromFav({required QuoteEntity quote}) {
    favRepo.removeFromFav(quote: quote);
    emit(RemovedFromFavorite(quote: quote));
  }
}
