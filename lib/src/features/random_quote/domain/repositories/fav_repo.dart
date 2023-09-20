import 'package:quotes_app/src/features/random_quote/domain/entities/quote_entity.dart';

abstract class FavRepo {
  void addToFav({required QuoteEntity quote});
  void removeFromFav({required QuoteEntity quote});
}
