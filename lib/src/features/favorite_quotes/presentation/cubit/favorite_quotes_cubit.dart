import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_quotes_state.dart';

class FavoriteQuotesCubit extends Cubit<FavoriteQuotesState> {
  FavoriteQuotesCubit() : super(FavoriteQuotesInitial());
}
