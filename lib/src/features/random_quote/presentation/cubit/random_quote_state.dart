part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final QuoteEntity quote;

  const RandomQuoteLoaded({required this.quote});

  @override
  List<Object> get props => [quote];
}

class RandomQuoteError extends RandomQuoteState {
  final String error;

  const RandomQuoteError({required this.error});

  @override
  List<Object> get props => [error];
}

class AddedToFavorite extends RandomQuoteState {
  final QuoteEntity quote;

  const AddedToFavorite({required this.quote});
  @override
  List<Object> get props => [quote];
}

class RemovedFromFavorite extends RandomQuoteState {
  final QuoteEntity quote;

  const RemovedFromFavorite({required this.quote});
  @override
  List<Object> get props => [quote];
}
